`timescale 1ns / 1ps

module top(
    input [127:0] plane,
    input [127:0] key,
    input cal_en,
    input clk,
    output [127:0] cipher_text
    );

wire [127:0] Mux_pipe;
wire sel;
wire [3:0]count;
wire reg_en;
//whole phase
controller ctrl(.clk(clk),.en(cal_en),.sel(sel),.count(count),.reg_en(reg_en));
    

wire [127:0] tmp1 = plane^key;
wire [127:0] round_to_MUX;


wire [127:0] reg_to_round;
MUX MUX(.in1(tmp1),.in2(round_to_MUX),.sel(sel),.out(Mux_pipe));
pipe pipe(.in(Mux_pipe),.clk(clk),.en(reg_en),.out(reg_to_round));

wire [127:0] key_MUX_to_reg;
wire [127:0] key_Round_to_MUX;
wire [127:0] key_reg_to_round;
Round_Module Round_Module(.Input(reg_to_round),.Key(key_reg_to_round),.Round_Count(count),.output_key(key_Round_to_MUX),.Output(round_to_MUX));
MUX KEY_MUX(.in1(key),.in2(key_Round_to_MUX),.sel(sel),.out(key_MUX_to_reg));
pipe key_reg(.in(key_MUX_to_reg),.en(reg_en),.clk(clk),.out(key_reg_to_round));

FinalRound_Module FinalRound_Module(.Input(reg_to_round),.Key(key_reg_to_round),.Round_count(count),.output_key(),.Output(cipher_text));
    
endmodule
