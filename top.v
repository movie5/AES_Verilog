`timescale 1ns / 1ps

module top(
    input [127:0] plane,
    input [127:0] key,
    input cal_en
    );
    
wire [127:0] tmp1 = plane^key;
wire [127:0] tmp2;
wire [127:0] Mux_pipe;
wire sel;
wire clk;
    
MUX MUX(.in1(tmp1),.in2(tmp2),.sel(sel),.out(Mux_pipe));
pipe pipe(.in(Mux_pipe),.clk(clk),.out(tmp2));
controller ctrl(.clk(clk),.en(cal_en),.sel(sel));
clk_wiz_0 clk_wiz_0(.clk_out1(clk),.reset(1'b0),.clk_in1(1'b1));

    
    
endmodule
