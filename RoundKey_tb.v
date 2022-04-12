`timescale 1ns / 1ps

module RoundKey_tb;

reg     [  3:0] round;
reg     [127:0] in;

wire    [127:0] out;

integer error_count;

initial
begin
round   = 4'd0      ;
in      = 128'h0    ;
error_count = 0;

#10;
round   = 4'd0      ;
in      = 128'h00010203_04050607_08090A0B_0C0D0E0F;
#1;
if(out!=128'h00010203_04050607_08090A0B_0C0D0E0F) begin
    error_count = error_count + 1;
    $display("testcase#1 error");
end

#10;
round   = 4'd1      ;
in      = 128'h00010203_04050607_08090A0B_0C0D0E0F;
#1;
if(out!=128'hD6AA74FD_D2AF72FA_DAA678F1_D6AB76FE) begin
    error_count = error_count + 1;
    $display("testcase#2 error");
end

#10;
if(error_count==0) begin
    $display("all test case is passed");
end
$finish;

end

RoundKey RK1(.round(round), .in(in), .out(out));

endmodule
