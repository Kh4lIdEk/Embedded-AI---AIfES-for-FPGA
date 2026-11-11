`timescale 1ns/1ps
module tb_dense_mac_axi;
    localparam integer KK = 8, MM = 4;
    reg clk = 0, rstn = 0;
    always #5 clk = ~clk;

    reg [11:0] awaddr = 0, araddr = 0;
    reg awvalid = 0, wvalid = 0, arvalid = 0, bready = 0, rready = 0;
    reg [31:0] wdata = 0;
    wire awready, wready, bvalid, arready, rvalid;
    wire [31:0] rdata; wire [1:0] bresp, rresp;
    reg [31:0] tdata = 0; reg tvalid = 0, tlast = 0; wire tready;

    dense_mac_axi dut (
        .aclk(clk), .aresetn(rstn),
        .s_axi_awaddr(awaddr), .s_axi_awvalid(awvalid), .s_axi_awready(awready),
        .s_axi_wdata(wdata), .s_axi_wstrb(4'hF), .s_axi_wvalid(wvalid), .s_axi_wready(wready),
        .s_axi_bresp(bresp), .s_axi_bvalid(bvalid), .s_axi_bready(bready),
        .s_axi_araddr(araddr), .s_axi_arvalid(arvalid), .s_axi_arready(arready),
        .s_axi_rdata(rdata), .s_axi_rresp(rresp), .s_axi_rvalid(rvalid), .s_axi_rready(rready),
        .s_axis_tdata(tdata), .s_axis_tvalid(tvalid), .s_axis_tready(tready), .s_axis_tlast(tlast));

    task axi_write(input [11:0] a, input [31:0] d);
    begin
        @(negedge clk); awaddr = a; wdata = d; awvalid = 1; wvalid = 1; bready = 1;
        @(posedge clk); #1; awvalid = 0; wvalid = 0;
        repeat (2) @(posedge clk);
    end
    endtask

    task axi_read(input [11:0] a, output [31:0] d);
    begin
        @(negedge clk); araddr = a; arvalid = 1; rready = 0;
        @(posedge clk); #1; arvalid = 0;
        wait (rvalid);
        d = rdata; rready = 1;
        @(posedge clk); #1; rready = 0;
    end
    endtask

    task send_word(input [31:0] w);
    begin
        @(negedge clk); tdata = w; tvalid = 1;
        @(posedge clk); while (!tready) @(posedge clk);
        #1;
    end
    endtask

    real xv [0:KK-1];
    real wv [0:MM*KK-1];
    real refv [0:MM-1];
    real got, diff;
    reg [31:0] d;
    integer j, k, errors;

    initial begin
        errors = 0;
        for (k = 0; k < KK; k = k + 1) xv[k] = 0.5 * (k + 1);
        for (j = 0; j < MM; j = j + 1) begin
            refv[j] = 0.0;
            for (k = 0; k < KK; k = k + 1) begin
                wv[j*KK+k] = 0.25 * (j + 1) - 0.1 * k;
                refv[j] = refv[j] + xv[k] * wv[j*KK+k];
            end
        end
        repeat (10) @(posedge clk); rstn = 1; repeat (5) @(posedge clk);

        axi_write(12'h008, KK);
        axi_write(12'h00C, MM);
        axi_write(12'h000, 1);
        for (k = 0; k < KK; k = k + 1) send_word($shortrealtobits(xv[k]));
        for (j = 0; j < MM*KK; j = j + 1) send_word($shortrealtobits(wv[j]));
        @(negedge clk); tvalid = 0;

        d = 0;
        while (!d[1]) axi_read(12'h004, d);
        axi_read(12'h010, d); $display("cycles = %0d", d);

        for (j = 0; j < MM; j = j + 1) begin
            axi_read(12'h800 + 4*j, d);
            got = $bitstoshortreal(d);
            diff = got - refv[j]; if (diff < 0) diff = -diff;
            $display("y[%0d] hw=%f ref=%f", j, got, refv[j]);
            if (diff > 1e-3) errors = errors + 1;
        end
        if (errors == 0) $display("TEST PASSED"); else $display("TEST FAILED (%0d errors)", errors);
        $finish;
    end
endmodule
