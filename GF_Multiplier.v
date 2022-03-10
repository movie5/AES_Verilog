`timescale 1ns / 1ps

module GF_Multiplier(
    input [7:0] in1,
    input [7:0] in2,
    output [7:0] out
    );
    
//Modulo polynomials    
localparam modulo = 8'b00011011; // 9'b100011011
integer i;
integer j;

reg [8:0] tmp = 9'b0_0000_0000;
wire [7:0] GF_out;
reg [7:0] acc;

always @(in1, in2)
begin
    acc = 8'b0000_0000;
    for(i=7; i>=0; i=i-1) begin
        if(in1[i] == 1'b1) begin
            tmp[8] = 1'b0;
            tmp[7:0] = in2;
            for(j=1; j<=i; j=j+1) begin
                tmp = tmp << 1;
                #1;
                if(tmp[8] == 1'b1) begin
                    //#5;
                    tmp[8] = 1'b0;
                    tmp[7] = tmp[7]^modulo[7];
                    tmp[6] = tmp[6]^modulo[6];
                    tmp[5] = tmp[5]^modulo[5];
                    tmp[4] = tmp[4]^modulo[4];
                    tmp[3] = tmp[3]^modulo[3];
                    tmp[2] = tmp[2]^modulo[2];
                    tmp[1] = tmp[1]^modulo[1];
                    tmp[0] = tmp[0]^modulo[0];
                    //tmp[7:0] = GF_out;
                end
            end
            acc[7] = acc[7]^tmp[7];
            acc[6] = acc[6]^tmp[6];
            acc[5] = acc[5]^tmp[5];
            acc[4] = acc[4]^tmp[4];
            acc[3] = acc[3]^tmp[3];
            acc[2] = acc[2]^tmp[2];
            acc[1] = acc[1]^tmp[1];
            acc[0] = acc[0]^tmp[0];              
        end
    end
end

//GF_Adder GFA1(.in1(tmp[7:0]),.in2(modulo),.out(GF_out));
assign out = acc;

endmodule