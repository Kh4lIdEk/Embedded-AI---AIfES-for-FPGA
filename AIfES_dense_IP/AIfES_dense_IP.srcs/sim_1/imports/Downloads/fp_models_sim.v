`timescale 1ns/1ps
// SIMULATION ONLY stand-ins for the Xilinx IPs. Do NOT add to synthesis.
module fp_mul(
    input aclk,
    input s_axis_a_tvalid, input [31:0] s_axis_a_tdata, input s_axis_a_tlast,
    input s_axis_b_tvalid, input [31:0] s_axis_b_tdata,
    output reg m_axis_result_tvalid, output reg [31:0] m_axis_result_tdata,
    output reg m_axis_result_tlast);
    reg v1, l1; reg [31:0] d1;
    always @(posedge aclk) begin
        v1 <= s_axis_a_tvalid & s_axis_b_tvalid;
        l1 <= s_axis_a_tlast;
        d1 <= $shortrealtobits($bitstoshortreal(s_axis_a_tdata) * $bitstoshortreal(s_axis_b_tdata));
        m_axis_result_tvalid <= v1; m_axis_result_tlast <= l1; m_axis_result_tdata <= d1;
    end
endmodule

module fp_acc(
    input aclk,
    input s_axis_a_tvalid, input [31:0] s_axis_a_tdata, input s_axis_a_tlast,
    output reg m_axis_result_tvalid, output reg [31:0] m_axis_result_tdata,
    output reg m_axis_result_tlast);
    real sum;
    initial sum = 0.0;
    always @(posedge aclk) begin
        m_axis_result_tvalid <= 1'b0; m_axis_result_tlast <= 1'b0;
        if (s_axis_a_tvalid) begin
            if (s_axis_a_tlast) begin
                m_axis_result_tdata  <= $shortrealtobits(sum + $bitstoshortreal(s_axis_a_tdata));
                m_axis_result_tvalid <= 1'b1; m_axis_result_tlast <= 1'b1;
                sum = 0.0;
            end else sum = sum + $bitstoshortreal(s_axis_a_tdata);
        end
    end
endmodule
