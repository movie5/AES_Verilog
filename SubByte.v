module SubByte(
    input [127:0] Input,
    output [127:0] Output
);

s_box s1(Input[7:0], Output[7:0]);
s_box s2(Input[15:8], Output[15:8]);
s_box s3(Input[23:16], Output[23:16]);
s_box s4(Input[31:24], Output[31:24]);

s_box s5(Input[39:32], Output[39:32]);
s_box s6(Input[47:40], Output[47:40]);
s_box s7(Input[55:48], Output[55:48]);
s_box s8(Input[63:56], Output[63:56]);

s_box s9(Input[71:64], Output[71:64]);
s_box s10(Input[79:72], Output[79:72]);
s_box s11(Input[87:80], Output[87:80]);
s_box s12(Input[95:88], Output[95:88]);

s_box s13(Input[103:96], Output[103:96]);
s_box s14(Input[111:104], Output[111:104]);
s_box s15(Input[119:112], Output[119:112]);
s_box s16(Input[127:120], Output[127:120]);

endmodule