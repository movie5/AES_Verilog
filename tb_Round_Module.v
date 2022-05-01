`timescale 1ns / 1ps

module Round_Module_tb;

reg     [3:0] round_count;
reg     [127:0] in;
reg 	[127:0] key;
wire    [127:0] output_key;
wire	[127:0] out;

integer error_count;

initial
begin
round_count   = 4'd0      ;
in      = 128'h0    ;
error_count = 0;
key 	= 128'h0;
#10;
round_count   = 4'd1      ;
key      = 128'h00010203_04050607_08090A0B_0C0D0E0F;
#1;
if(output_key!=128'hD6AA74FD_D2AF72FA_DAA678F1_D6AB76FE) begin
    error_count = error_count + 1;
    $display("testcase#2 error");
end

#10;
if(error_count==0) begin
    $display("all test case is passed");
end
$finish;

end

Round_Module round_module(.Input(in), .Key(key), .Round_count(round_count), .output_key(output_key), .Output(out));

endmodule
