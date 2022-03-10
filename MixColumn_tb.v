`timescale 1ns / 1ps

module MixColumn_tb;
//intput
reg [127:0] in;
//output
wire [127:0] out;

MixColumn MC(.Input(in), .Output(out));

initial
begin
    in = 128'h0000_0000_0000_0000_0000_0000_0000_0000;
    #1; //module delay
    if(out!==128'h0000_0000_0000_0000_0000_0000_0000_0000)
        $display("testcase #0 error");
    else
        $display("testcase #0 OK");
        
    #10;
    in = 128'hD4BF_5D30_E0B4_52AE_B841_11F1_1E27_98E5;
    #1; //module delay
    if(out!==128'h0466_81E5_E0CB_199A_48F8_D37A_2806_264C)
        $display("testcase #1 error");
    else
        $display("testcase #1 OK");
        
    #10;
    in = 128'h876E_46A6_F24C_E78C_4D90_4AD8_97EC_C395;
    #1; //module delay
    if(out!==128'h4737_94ED_40D4_E4A5_A370_3AA6_4C9F_42BC)
        $display("testcase #2 error");
    else
        $display("testcase #2 OK");
        
    #10;
    $finish;
end
endmodule
