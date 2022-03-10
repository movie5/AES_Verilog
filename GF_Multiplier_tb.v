`timescale 1ns / 1ps

module GF_Multiplier_tb;
    
reg [7:0] in1;
reg [7:0] in2;
wire [7:0] out1;
wire [7:0] out2;
    
GF_Multiplier GFM(.in1(in1),.in2(in2),.out(out1));
GF_Multiplier2 GFM2(.in1(in1),.in2(in2),.out(out2));
    
initial begin
    in1 = 8'b0000_0001;
    in2 = 8'b0000_0000;
#10;
    in1 = 8'b0000_0010;
    in2 = 8'b1000_1001;
#10;
    in1 = 8'b0000_0011;
    in2 = 8'b0110_0001;
#10;
    in1 = 8'b0000_0001;
    in2 = 8'b0010_1110;
#10;
end
    
    
endmodule