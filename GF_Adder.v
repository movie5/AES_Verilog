`timescale 1ns / 1ps

module GF_Adder(
    input [7:0] in1,
    input [7:0] in2,
    output [7:0] out
    );
    
assign out[0] = in1[0]^in2[0];
assign out[1] = in1[1]^in2[1];
assign out[2] = in1[2]^in2[2];
assign out[3] = in1[3]^in2[3];
assign out[4] = in1[4]^in2[4];
assign out[5] = in1[5]^in2[5];
assign out[6] = in1[6]^in2[6];
assign out[7] = in1[7]^in2[7];

endmodule
