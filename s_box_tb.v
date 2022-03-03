`timescale 1ns / 1ps

module s_box_tb;
parameter MODULE_DELAY = 10;
//input
reg [7:0] state;
//comparison
reg [7:0] s_box_out_compare [0:255];
//output
wire [7:0] s_box_out;
//loop control integer, file writer integer, error count integer
integer i, FID, error_count;

s_box s_box_1(.in(state), .out(s_box_out));

initial
begin
    state = 8'h00;
    error_count = 0;
    //A text file called s_box.txt is required
    $readmemh("s_box.txt",s_box_out_compare);
    FID = $fopen("Result.txt");
    #10
    for(i=0; i<256; i=i+1) begin
        #MODULE_DELAY;
        if(s_box_out!==s_box_out_compare[i]) begin
            $fdisplay(FID, "testcase#%d error", i);
            error_count = error_count + 1;
        end
        #10 state = state + 1;
    end
    #10;
    if(error_count === 0)
        $fdisplay(FID, "s_box_tb\nall testcases success");
    else
        $fdisplay(FID, "s_box_tb\n%d testcases error", error_count);
    $fclose(FID);
    $finish;
end
endmodule
