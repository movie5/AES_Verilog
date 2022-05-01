`timescale 1ns / 1ps
module Round_Module(
    input [127:0] Input, 
    input [127:0] Key,
    input [3:0] Round_count,
    output [127:0] output_key,
    output [127:0] Output
);

wire [127:0] Result [0:2];

SubByte sub_byte(.Input(Input), .Output(Result[0]));
ShiftRows shift_row(.in(Result[0]), .out(Result[1]));
MixColumn mix_column(.in(Result[1]), .out(Result[2]));
RoundKey round_key(.round(Round_count), .in(Key), .out(output_key));

assign Output = output_key ^ Result[2];

endmodule