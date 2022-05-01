`timescale 1ns / 1ps


module pipe(
    input [127:0] in,
    input clk,
    output [127:0] out
    );
    
    reg tmp;
    
    always @(posedge clk)
    begin
        tmp <= in;
    end
    
    assign out = tmp;
    
    
    
endmodule
