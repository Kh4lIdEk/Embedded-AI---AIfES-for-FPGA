`timescale 1ns/1ps

module MAC_Dense_Layer #(
    parameter integer MAX_K = 1024,
    parameter integer MAX_M = 256
)(
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF s_axi:s_axis, ASSOCIATED_RESET aresetn" *)
    input  wire        aclk,
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input  wire        aresetn,

    // AXI4-Lite slave
    input  wire [11:0] s_axi_awaddr,
    input  wire        s_axi_awvalid,
    output wire        s_axi_awready,
    input  wire [31:0] s_axi_wdata,
    input  wire [3:0]  s_axi_wstrb,
    input  wire        s_axi_wvalid,
    output wire        s_axi_wready,
    output wire [1:0]  s_axi_bresp,
    output reg         s_axi_bvalid,
    input  wire        s_axi_bready,
    input  wire [11:0] s_axi_araddr,
    input  wire        s_axi_arvalid,
    output wire        s_axi_arready,
    output reg  [31:0] s_axi_rdata,
    output wire [1:0]  s_axi_rresp,
    output reg         s_axi_rvalid,
    input  wire        s_axi_rready,

    // AXI4-Stream slave
    input  wire [31:0] s_axis_tdata,
    input  wire        s_axis_tvalid,
    output wire        s_axis_tready,
    input  wire        s_axis_tlast
);

    localparam [1:0] S_IDLE = 2'd0, S_LOADX = 2'd1, S_STREAM = 2'd2, S_WAIT = 2'd3;
    reg [1:0]  state;
    reg [10:0] k_reg;
    reg [8:0]  m_reg;
    reg [10:0] kcnt;
    reg [8:0]  rows_in;
    reg [8:0]  rcnt;
    reg        done, err;
    reg [31:0] cyc;

    reg        s0_valid, s0_last;
    reg [31:0] s0_w;
    reg [31:0] x_q;

    (* ram_style = "block" *) reg [31:0] x_mem   [0:MAX_K-1];
    (* ram_style = "block" *) reg [31:0] res_mem [0:MAX_M-1];

    wire        mul_valid, mul_last;
    wire [31:0] mul_data;
    wire        acc_valid, acc_last;
    wire [31:0] acc_data;

    // ---------------------------------------------------------- AXI-Lite write
    wire wr_fire = s_axi_awvalid & s_axi_wvalid & ~s_axi_bvalid;
    assign s_axi_awready = wr_fire;
    assign s_axi_wready  = wr_fire;
    assign s_axi_bresp   = 2'b00;
    always @(posedge aclk) begin
        if (!aresetn)          s_axi_bvalid <= 1'b0;
        else if (wr_fire)      s_axi_bvalid <= 1'b1;
        else if (s_axi_bready) s_axi_bvalid <= 1'b0;
    end

    wire reg_wr    = wr_fire & ~s_axi_awaddr[11];
    wire start_req = reg_wr & (s_axi_awaddr[4:2] == 3'd0) & s_axi_wdata[0] & (state == S_IDLE);

    always @(posedge aclk) begin
        if (!aresetn) begin
            k_reg <= 11'd0;
            m_reg <= 9'd0;
        end else if (reg_wr && state == S_IDLE) begin
            case (s_axi_awaddr[4:2])
                3'd2: k_reg <= s_axi_wdata[10:0];
                3'd3: m_reg <= s_axi_wdata[8:0];
                default: ;
            endcase
        end
    end

    // ------------------------------------------------------------------ FSM
    wire acc_take = acc_valid & acc_last & ((state == S_STREAM) | (state == S_WAIT));
    assign s_axis_tready = (state == S_LOADX) || (state == S_STREAM);
    wire in_fire   = s_axis_tvalid & s_axis_tready;
    wire row_last  = (kcnt == (k_reg - 11'd1));
    wire params_ok = (k_reg != 0) && (k_reg <= MAX_K) && (m_reg != 0) && (m_reg <= MAX_M);

    always @(posedge aclk) begin
        if (!aresetn) begin
            state <= S_IDLE; kcnt <= 0; rows_in <= 0; rcnt <= 0;
            done <= 0; err <= 0; cyc <= 0;
            s0_valid <= 0; s0_last <= 0; s0_w <= 0;
        end else begin
            s0_valid <= 1'b0;
            if (state != S_IDLE) cyc <= cyc + 32'd1;

            case (state)
                S_IDLE: begin
                    if (start_req) begin
                        done <= 1'b0; err <= 1'b0;
                        kcnt <= 0; rows_in <= 0; rcnt <= 0; cyc <= 0;
                        if (params_ok) state <= S_LOADX;
                        else           err   <= 1'b1;
                    end
                end
                S_LOADX: begin
                    if (in_fire) begin
                        if (row_last) begin kcnt <= 0; state <= S_STREAM; end
                        else          kcnt <= kcnt + 11'd1;
                    end
                end
                S_STREAM: begin
                    if (in_fire) begin
                        s0_valid <= 1'b1;
                        s0_w     <= s_axis_tdata;
                        s0_last  <= row_last;
                        if (row_last) begin
                            kcnt    <= 0;
                            rows_in <= rows_in + 9'd1;
                            if (rows_in == (m_reg - 9'd1)) state <= S_WAIT;
                        end else begin
                            kcnt <= kcnt + 11'd1;
                        end
                    end
                end
                default: ; // S_WAIT
            endcase

               if (acc_take) begin
                rcnt <= rcnt + 9'd1;
                if (rcnt == (m_reg - 9'd1)) begin
                    state <= S_IDLE;
                    done  <= 1'b1;
                end
            end
        end
    end

    // ------------------------------------------------------------- memories
    always @(posedge aclk)
        if (in_fire && state == S_LOADX) x_mem[kcnt[9:0]] <= s_axis_tdata;
    always @(posedge aclk)
        x_q <= x_mem[kcnt[9:0]];

    always @(posedge aclk)
           if (acc_take)
            res_mem[rcnt[7:0]] <= acc_data;

    // ------------------------------------------------------------ MAC chain
    fp_mul u_mul (
        .aclk(aclk),
        .s_axis_a_tvalid(s0_valid), .s_axis_a_tdata(x_q),  .s_axis_a_tlast(s0_last),
        .s_axis_b_tvalid(s0_valid), .s_axis_b_tdata(s0_w),
        .m_axis_result_tvalid(mul_valid), .m_axis_result_tdata(mul_data),
        .m_axis_result_tlast(mul_last)
    );
       fp_acc u_acc (
       .aclk(aclk),
       .s_axis_a_tvalid(mul_valid), .s_axis_a_tdata(mul_data), .s_axis_a_tlast(mul_last),
       .s_axis_operation_tvalid(mul_valid), .s_axis_operation_tdata(8'h00),
       .m_axis_result_tvalid(acc_valid), .m_axis_result_tdata(acc_data),
       .m_axis_result_tlast(acc_last)
   );

    // ----------------------------------------------------------- AXI-Lite read
    reg [1:0]  rd_st;
    reg [11:0] ar_addr;
    reg [31:0] res_q;
    assign s_axi_arready = (rd_st == 2'd0);
    assign s_axi_rresp   = 2'b00;
    always @(posedge aclk) res_q <= res_mem[ar_addr[9:2]];

    always @(posedge aclk) begin
        if (!aresetn) begin
            rd_st <= 2'd0; s_axi_rvalid <= 1'b0; s_axi_rdata <= 32'd0; ar_addr <= 12'd0;
        end else begin
            case (rd_st)
                2'd0: if (s_axi_arvalid) begin ar_addr <= s_axi_araddr; rd_st <= 2'd1; end
                2'd1: rd_st <= 2'd2;
                2'd2: begin
                    s_axi_rvalid <= 1'b1;
                    rd_st        <= 2'd3;
                    if (ar_addr[11]) s_axi_rdata <= res_q;
                    else case (ar_addr[4:2])
                        3'd1:    s_axi_rdata <= {29'd0, err, done, (state != S_IDLE)};
                        3'd2:    s_axi_rdata <= {21'd0, k_reg};
                        3'd3:    s_axi_rdata <= {23'd0, m_reg};
                        3'd4:    s_axi_rdata <= cyc;
                        default: s_axi_rdata <= 32'd0;
                    endcase
                end
                2'd3: if (s_axi_rready) begin s_axi_rvalid <= 1'b0; rd_st <= 2'd0; end
            endcase
        end
    end
endmodule
