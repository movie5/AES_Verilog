`timescale 1ns / 1ps

module GF_Multiplier_tb;
    
reg [7:0] in1;
reg [7:0] in2;
wire [7:0] out;
    
GF_Multiplier GFM(.in1(in1),.in2(in2),.out(out));
    
initial begin
    in1 = 8'b0000_0000;
    in2 = 8'b0000_0000;
    
    #30
    
    in1 = 8'b0010_0110;
    in2 = 8'b1001_1110;
    #30;
    
end
    
    
endmodule