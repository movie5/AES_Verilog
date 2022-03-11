`timescale 1ns / 10ps

module MixColumn_tb;

reg [127:0] in;
wire [127:0] out;

initial begin
    in = 128'hD4BF5D30E0B452AEB84111F11E2798E5;
end

MixColumn MC_1(in, out);

endmodule
