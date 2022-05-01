`timescale 1ns / 1ps


module pipe(
    input [127:0] in,
    input en,
    input clk,
    output [127:0] out
    );
    
    reg tmp;
    
    always @(posedge clk)
    begin
        if(en == 1'b1)
            tmp <= in;
        else continue;
    end
    
    assign out = tmp;
    
    
    
endmodule
