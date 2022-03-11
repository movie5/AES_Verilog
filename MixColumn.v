module MixColumn(
    input [127:0] in,
    output [127:0] out
);

wire [31:0] w0, w1, w2, w3, w0_o, w1_o, w2_o, w3_o;

assign w0 = in[127:96];
assign w1 = in[95:64];
assign w2 = in[63:32];
assign w3 = in[31:0];

Cal_Word m0 (w0, w0_o);
Cal_Word m1 (w1, w1_o);
Cal_Word m2 (w2, w2_o);
Cal_Word m3 (w3, w3_o);

assign out = {w0_o, w1_o, w2_o, w3_o};

endmodule

module Cal_Word(
    input [31:0] in_word,
    output [31:0] out_word
);

wire [7:0] s0, s1, s2, s3,
s0_m2, s1_m2, s2_m2, s3_m2,
s0_m3, s1_m3, s2_m3, s3_m3,
s0_o, s1_o, s2_o, s3_o;

assign s0 = in_word[31:24];
assign s1 = in_word[23:16];
assign s2 = in_word[15:8];
assign s3 = in_word[7:0];


GF_Multiplier gm1 (8'b00000010, s0, s0_m2);
GF_Multiplier gm2 (8'b00000010, s1, s1_m2);
GF_Multiplier gm3 (8'b00000010, s2, s2_m2);
GF_Multiplier gm4 (8'b00000010, s3, s3_m2);

GF_Multiplier gm5 (8'b00000011, s0, s0_m3);
GF_Multiplier gm6 (8'b00000011, s1, s1_m3);
GF_Multiplier gm7 (8'b00000011, s2, s2_m3);
GF_Multiplier gm8 (8'b00000011, s3, s3_m3);

assign s0_o = s0_m2 ^ s1_m3 ^ s2 ^ s3;
assign s1_o = s0 ^ s1_m2 ^ s2_m3 ^ s3;
assign s2_o = s0 ^ s1 ^ s2_m2 ^ s3_m3;
assign s3_o = s0_m3 ^ s1 ^ s2 ^ s3_m2;

assign out_word = {s0_o, s1_o, s2_o, s3_o};

endmodule
