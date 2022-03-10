`timescale 1ns / 1ps

module MixColumn(
    input [127:0] Input,
    output [127:0] Output
    );
    /*************************
    *  Input / Output is {MSB,2 ... 15,LSB} and is as follows
    *  MSB 5  9   13
    *   2  6  10  14
    *   3  7  11  15
    *   4  8  12  LSB
    **************************/
    wire [7:0] temp_mul [0:63];
    //wire [7:0] tmep_add [0:31];
    
    GF_Multiplier2 GFM01(.in1(8'h02), .in2(Input[127:120]), .out(temp_mul[63]));
    GF_Multiplier2 GFM02(.in1(8'h03), .in2(Input[119:112]), .out(temp_mul[62]));
    GF_Multiplier2 GFM03(.in1(8'h01), .in2(Input[111:104]), .out(temp_mul[61]));
    GF_Multiplier2 GFM04(.in1(8'h01), .in2(Input[103:96]), .out(temp_mul[60]));
    GF_Multiplier2 GFM05(.in1(8'h01), .in2(Input[127:120]), .out(temp_mul[59]));
    GF_Multiplier2 GFM06(.in1(8'h02), .in2(Input[119:112]), .out(temp_mul[58]));
    GF_Multiplier2 GFM07(.in1(8'h03), .in2(Input[111:104]), .out(temp_mul[57]));
    GF_Multiplier2 GFM08(.in1(8'h01), .in2(Input[103:96]), .out(temp_mul[56]));
    GF_Multiplier2 GFM09(.in1(8'h01), .in2(Input[127:120]), .out(temp_mul[55]));
    GF_Multiplier2 GFM10(.in1(8'h01), .in2(Input[119:112]), .out(temp_mul[54]));
    GF_Multiplier2 GFM11(.in1(8'h02), .in2(Input[111:104]), .out(temp_mul[53]));
    GF_Multiplier2 GFM12(.in1(8'h03), .in2(Input[103:96]), .out(temp_mul[52]));
    GF_Multiplier2 GFM13(.in1(8'h03), .in2(Input[127:120]), .out(temp_mul[51]));
    GF_Multiplier2 GFM14(.in1(8'h01), .in2(Input[119:112]), .out(temp_mul[50]));
    GF_Multiplier2 GFM15(.in1(8'h01), .in2(Input[111:104]), .out(temp_mul[49]));
    GF_Multiplier2 GFM16(.in1(8'h02), .in2(Input[103:96]), .out(temp_mul[48]));
    GF_Multiplier2 GFM17(.in1(8'h02), .in2(Input[95:88]), .out(temp_mul[47]));
    GF_Multiplier2 GFM18(.in1(8'h03), .in2(Input[87:80]), .out(temp_mul[46]));
    GF_Multiplier2 GFM19(.in1(8'h01), .in2(Input[79:72]), .out(temp_mul[45]));
    GF_Multiplier2 GFM20(.in1(8'h01), .in2(Input[71:64]), .out(temp_mul[44]));
    GF_Multiplier2 GFM21(.in1(8'h01), .in2(Input[95:88]), .out(temp_mul[43]));
    GF_Multiplier2 GFM22(.in1(8'h02), .in2(Input[87:80]), .out(temp_mul[42]));
    GF_Multiplier2 GFM23(.in1(8'h03), .in2(Input[79:72]), .out(temp_mul[41]));
    GF_Multiplier2 GFM24(.in1(8'h01), .in2(Input[71:64]), .out(temp_mul[40]));
    GF_Multiplier2 GFM25(.in1(8'h01), .in2(Input[95:88]), .out(temp_mul[39]));
    GF_Multiplier2 GFM26(.in1(8'h01), .in2(Input[87:80]), .out(temp_mul[38]));
    GF_Multiplier2 GFM27(.in1(8'h02), .in2(Input[79:72]), .out(temp_mul[37]));
    GF_Multiplier2 GFM28(.in1(8'h03), .in2(Input[71:64]), .out(temp_mul[36]));
    GF_Multiplier2 GFM29(.in1(8'h03), .in2(Input[95:88]), .out(temp_mul[35]));
    GF_Multiplier2 GFM30(.in1(8'h01), .in2(Input[87:80]), .out(temp_mul[34]));
    GF_Multiplier2 GFM31(.in1(8'h01), .in2(Input[79:72]), .out(temp_mul[33]));
    GF_Multiplier2 GFM32(.in1(8'h02), .in2(Input[71:64]), .out(temp_mul[32]));
    GF_Multiplier2 GFM33(.in1(8'h02), .in2(Input[63:56]), .out(temp_mul[31]));
    GF_Multiplier2 GFM34(.in1(8'h03), .in2(Input[55:48]), .out(temp_mul[30]));
    GF_Multiplier2 GFM35(.in1(8'h01), .in2(Input[47:40]), .out(temp_mul[29]));
    GF_Multiplier2 GFM36(.in1(8'h01), .in2(Input[39:32]), .out(temp_mul[28]));
    GF_Multiplier2 GFM37(.in1(8'h01), .in2(Input[63:56]), .out(temp_mul[27]));
    GF_Multiplier2 GFM38(.in1(8'h02), .in2(Input[55:48]), .out(temp_mul[26]));
    GF_Multiplier2 GFM39(.in1(8'h03), .in2(Input[47:40]), .out(temp_mul[25]));
    GF_Multiplier2 GFM40(.in1(8'h01), .in2(Input[39:32]), .out(temp_mul[24]));
    GF_Multiplier2 GFM41(.in1(8'h01), .in2(Input[63:56]), .out(temp_mul[23]));
    GF_Multiplier2 GFM42(.in1(8'h01), .in2(Input[55:48]), .out(temp_mul[22]));
    GF_Multiplier2 GFM43(.in1(8'h02), .in2(Input[47:40]), .out(temp_mul[21]));
    GF_Multiplier2 GFM44(.in1(8'h03), .in2(Input[39:32]), .out(temp_mul[20]));
    GF_Multiplier2 GFM45(.in1(8'h03), .in2(Input[63:56]), .out(temp_mul[19]));
    GF_Multiplier2 GFM46(.in1(8'h01), .in2(Input[55:48]), .out(temp_mul[18]));
    GF_Multiplier2 GFM47(.in1(8'h01), .in2(Input[47:40]), .out(temp_mul[17]));
    GF_Multiplier2 GFM48(.in1(8'h02), .in2(Input[39:32]), .out(temp_mul[16]));
    GF_Multiplier2 GFM49(.in1(8'h02), .in2(Input[31:24]), .out(temp_mul[15]));
    GF_Multiplier2 GFM50(.in1(8'h03), .in2(Input[23:16]), .out(temp_mul[14]));
    GF_Multiplier2 GFM51(.in1(8'h01), .in2(Input[15:8]), .out(temp_mul[13]));
    GF_Multiplier2 GFM52(.in1(8'h01), .in2(Input[7:0]), .out(temp_mul[12]));
    GF_Multiplier2 GFM53(.in1(8'h01), .in2(Input[31:24]), .out(temp_mul[11]));
    GF_Multiplier2 GFM54(.in1(8'h02), .in2(Input[23:16]), .out(temp_mul[10]));
    GF_Multiplier2 GFM55(.in1(8'h03), .in2(Input[15:8]), .out(temp_mul[9]));
    GF_Multiplier2 GFM56(.in1(8'h01), .in2(Input[7:0]), .out(temp_mul[8]));
    GF_Multiplier2 GFM57(.in1(8'h01), .in2(Input[31:24]), .out(temp_mul[7]));
    GF_Multiplier2 GFM58(.in1(8'h01), .in2(Input[23:16]), .out(temp_mul[6]));
    GF_Multiplier2 GFM59(.in1(8'h02), .in2(Input[15:8]), .out(temp_mul[5]));
    GF_Multiplier2 GFM60(.in1(8'h03), .in2(Input[7:0]), .out(temp_mul[4]));
    GF_Multiplier2 GFM61(.in1(8'h03), .in2(Input[31:24]), .out(temp_mul[3]));
    GF_Multiplier2 GFM62(.in1(8'h01), .in2(Input[23:16]), .out(temp_mul[2]));
    GF_Multiplier2 GFM63(.in1(8'h01), .in2(Input[15:8]), .out(temp_mul[1]));
    GF_Multiplier2 GFM64(.in1(8'h02), .in2(Input[7:0]), .out(temp_mul[0]));
    
    assign Output = {(temp_mul[63]^temp_mul[62]^temp_mul[61]^temp_mul[60]),
                      (temp_mul[59]^temp_mul[58]^temp_mul[57]^temp_mul[56]),
                      (temp_mul[55]^temp_mul[54]^temp_mul[53]^temp_mul[52]),
                      (temp_mul[51]^temp_mul[50]^temp_mul[49]^temp_mul[48]),
                      (temp_mul[47]^temp_mul[46]^temp_mul[45]^temp_mul[44]),
                      (temp_mul[43]^temp_mul[42]^temp_mul[41]^temp_mul[40]),
                      (temp_mul[39]^temp_mul[38]^temp_mul[37]^temp_mul[36]),
                      (temp_mul[35]^temp_mul[34]^temp_mul[33]^temp_mul[32]),
                      (temp_mul[31]^temp_mul[30]^temp_mul[29]^temp_mul[28]),
                      (temp_mul[27]^temp_mul[26]^temp_mul[25]^temp_mul[24]),
                      (temp_mul[23]^temp_mul[22]^temp_mul[21]^temp_mul[20]),
                      (temp_mul[19]^temp_mul[18]^temp_mul[17]^temp_mul[16]),
                      (temp_mul[15]^temp_mul[14]^temp_mul[13]^temp_mul[12]),
                      (temp_mul[11]^temp_mul[10]^temp_mul[9]^temp_mul[8]),
                      (temp_mul[7]^temp_mul[6]^temp_mul[5]^temp_mul[4]),
                      (temp_mul[3]^temp_mul[2]^temp_mul[1]^temp_mul[0])};
endmodule