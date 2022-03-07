`timescale 1ns / 1ps

module tb_SubByte;

reg [127:0] Input;
wire [127:0] Output;

initial begin
  Input = 128'hEA835CF00445332D655D98AD8596B0C5;
end

SubByte subs(Input, Output);

endmodule