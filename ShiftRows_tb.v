`timescale 1ns / 1ps

module ShiftRows_tb;
//intput
reg [127:0] in;
//output
wire [127:0] out;

ShiftRows SR(.Input(in), .Output(out));

initial
begin
    in = 128'h0000_0000_0000_0000_0000_0000_0000_0000;
    #1; //module delay
    if(out!==128'h0000_0000_0000_0000_0000_0000_0000_0000)
        $display("testcase #0 error");
    else
        $display("testcase #0 OK");
        
    #10;
    in = 128'h28B2_864E_7AFE_476D_3365_4032_9C3D_311F;
    #1; //module delay
    if(out!==128'h28FE_401F_7A65_314E_333D_866D_9CB2_4732)
        $display("testcase #1 error");
    else
        $display("testcase #1 OK");
        
    #10;
    $finish;
end
endmodule
