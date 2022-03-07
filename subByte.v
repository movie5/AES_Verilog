`timescale 1ns / 1ps

module subByte( 
  input [127:0] in,
  output [127:0] out
);
  reg [127:0] tem;
  
always @*
  begin
    s_box u0(tem[7:0], in[7:0]);
    s_box u1(tem[15:8], in[15:8]);
    s_box u2(tem[23:16], in[23:16]);
    s_box u3(tem[31:24], in[31:24]);
    s_box u4(tem[39:32], in[39:32]);
    s_box u5(tem[47:40], in[47:40]);
    s_box u6(tem[55:48], in[55:48]);
    s_box u7(tem[63:56], in[63:56]);
    s_box u8(tem[71:64], in[71:64]);
    s_box u9(tem[79:72], in[79:72]);
    s_box u10(tem[87:80], in[87:80]);
    s_box u11(tem[95:88], in[95:88]);
    s_box u12(tem[103:96], in[103:96]);
    s_box u13(tem[111:104], in[111:104]);
    s_box u14(tem[119:112], in[119:112]);
    s_box u15(tem[127:120], in[127:120]);
    
  end
    assign out[7:0] = tem[7:0];
    assign out[15:8] = tem[15:8];
    assign out[23:16] = tem[23:16];
    assign out[31:24] = tem[31:24];
    assign out[39:32] = tem[39:32];
    assign out[47:40] = tem[47:40];
    assign out[55:48] = tem[55:48];
    assign out[63:56] = tem[63:56];
    assign out[71:64] = tem[71:64];
    assign out[79:72] = tem[79:72];
    assign out[87:80] = tem[87:80];
    assign out[95:88] = tem[95:88];
    assign out[103:96] = tem[103:96];
    assign out[111:104] = tem[111:104];
    assign out[119:112] = tem[119:112];
    assign out[127:120] = tem[127:120];

endmodule
