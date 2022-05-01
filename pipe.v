`timescale 1ns / 1ps

//register, 9번 돌아가기 위해
module pipe(
    input [127:0] in,  //mux의 결과에 따라 pre-round의 결과나 round의 결과를 받는다
    input clk,
    output [127:0] out // 다음 round의 input
    );
    
    reg tmp;
    
    always @(posedge clk) //clk+
    begin
        tmp <= in; 
    end
    
    assign out = tmp;
    
    
    
endmodule
