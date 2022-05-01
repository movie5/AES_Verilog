`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/01 16:33:51
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(
    input clk,
    input en,
    output reg sel,
    output reg [3:0] count,
    output reg reg_en
    );
  
    
    always @(posedge clk)
    begin
        if(en == 1'b0)
            count <= 4'b0000;
        else if(en == 1'b0)
            if(count == 4'b1010) continue;
            else count <= count + 4'b0001;
        else continue;
    end
    
    always @(count)
    begin
        case(count)
            4'b0000: begin sel <= 1'b0; reg_en <= 1'b1; end
            4'b0001: sel <= 1'b1;
            4'b0010: sel <= 1'b1;
            4'b0011: sel <= 1'b1;
            4'b0100: sel <= 1'b1;
            4'b0101: sel <= 1'b1;
            4'b0110: sel <= 1'b1;
            4'b0111: sel <= 1'b1;
            4'b1000: sel <= 1'b1;
            4'b1001: sel <= 1'b1;
            4'b1010: begin sel <= 1'b1; reg_en <= 1'b0; end
            default: begin sel <= 1'b1; reg_en <= 1'b0; end
        endcase
    
    end
    
    
endmodule
