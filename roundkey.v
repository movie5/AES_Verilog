`timescale 1ns / 1ps

module RoundKey(
    input   [  3:0] round   ,
    input   [127:0] in      ,
    output  [127:0] out
    );
    
reg    [ 7:0] round_const   ;

wire   [ 7:0] s [0:3]       ;
wire   [31:0] out_temp [0:3];
wire   [31:0] g             ;

always @(round) begin
    case(round)
        4'd1  : round_const = 8'h01;
        4'd2  : round_const = 8'h02;
        4'd3  : round_const = 8'h04;
        4'd4  : round_const = 8'h08;
        4'd5  : round_const = 8'h10;
        4'd6  : round_const = 8'h20;
        4'd7  : round_const = 8'h40;
        4'd8  : round_const = 8'h80;
        4'd9  : round_const = 8'h1B;
        4'd10 : round_const = 8'h36;
    endcase
end

s_box s1(.in(in[23:16]), .out(s[3]));
s_box s2(.in(in[15: 8]), .out(s[2]));
s_box s3(.in(in[ 7: 0]), .out(s[1]));
s_box s4(.in(in[31:24]), .out(s[0]));

assign g = {s[3],s[2],s[1],s[0]}^{round_const,24'd0};

assign out_temp[3] = g^in[127:96];
assign out_temp[2] = out_temp[3]^in[95:64];
assign out_temp[1] = out_temp[2]^in[63:32];
assign out_temp[0] = out_temp[1]^in[31:0];

assign out = (round==4'd0)? in : {out_temp[3], out_temp[2], out_temp[1], out_temp[0]};

endmodule