`timescale 1ns / 1ps

module ShiftRows(
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
    // word 1
    assign Output[127:96]={Input[127:120], Input[87:80],
                            Input[47:40], Input[7:0]};
    // word 2
    assign Output[95:64] ={Input[95:88], Input[55:48],
                            Input[15:8], Input[103:96]};
    // word 3
    assign Output[63:32] ={Input[63:56], Input[23:16],
                            Input[111:104], Input[71:64]};
    // word 4
    assign Output[31:0]  ={Input[31:24], Input[119:112],
                            Input[79:72], Input[39:32]};
endmodule
