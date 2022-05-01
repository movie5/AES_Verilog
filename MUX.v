`timescale 1ns / 1ps

module MUX(
    input [127:0] in1,
    input [127:0] in2,
    input sel,
    output [127:0] out
    );
    
    reg [127:0] tmp;
    
    always @ (in1, in2, sel)
    begin
        case(sel)
         1'b0 : tmp = in1;
         1'b1 : tmp = in2;
        endcase
    end
    
    
    assign out = tmp;
    
endmodule
