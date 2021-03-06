`timescale 1ns / 1ps

module GF_Adder_tb;
parameter MODULE_DELAY = 0.1;
//input
reg [7:0] in1, in2;
//comparison
reg [7:0] out_compare;
//output
wire [7:0] out;
//file writer integer, error count
integer error_count;

GF_Adder GF_Adder_1(.in1(in1), .in2(in2), .out(out));

initial
begin
    error_count = 0;
    in1 = 8'b0000_0000; in2 = 8'b0000_0000;
    out_compare = 8'b0000_0000;
    #MODULE_DELAY;
    if(out !== out_compare) begin
        $display("testcase#1 error");
        error_count = error_count + 1;
    end
    #10;
    in1 = 8'b1111_1111; in2 = 8'b0000_0000;
    out_compare = 8'b1111_1111;
    #MODULE_DELAY;
    if(out !== out_compare) begin
        $display("testcase#2 error");
        error_count = error_count + 1;
    end
    #10;
    in1 = 8'b0000_0000; in2 = 8'b1111_1111;
    out_compare = 8'b1111_1111;
    #MODULE_DELAY;
    if(out !== out_compare) begin
        $display("testcase#3 error");
        error_count = error_count + 1;
    end
    #10;
    in1 = 8'b1111_1111; in2 = 8'b1111_1111;
    out_compare = 8'b0000_0000;
    #MODULE_DELAY;
    if(out !== out_compare) begin
        $display("testcase#4 error");
        error_count = error_count + 1;
    end
    #10;
    if(error_count === 0)
        $display("GF_Adder_tb\nall testcases success");
    else
        $display("GF_Adder_tb\n%d testcases error", error_count);
    $finish;
end
endmodule
