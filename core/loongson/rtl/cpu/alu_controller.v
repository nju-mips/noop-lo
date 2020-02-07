`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/11 14:48:33
// Design Name: 
// Module Name: alu_controller
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


module alu_controller(
    input[3:0] alu_op,
    output reg [2:0]alu_ctr
    );
    always @(*)
    begin
        case(alu_op[3:0])
        4'b0000:alu_ctr = 3'b111;//ŒÓ·š(²»²úÉúÒç³ö£©
        4'b0001:alu_ctr = 3'b111;//Œõ·š(²»²úÉúÒç³ö£©
        4'b0010:alu_ctr = 3'b000;//Ç°µŒÁã
        4'b0011:alu_ctr = 3'b000;//Ç°µŒÒ»
        4'b0100:alu_ctr = 3'b100;//Óë
        4'b0101:alu_ctr = 3'b101;//slt/slti
        4'b0110:alu_ctr = 3'b010;//»ò
        4'b0111:alu_ctr = 3'b101;//sltu/sltiu
        4'b1000:alu_ctr = 3'b011;//»ò·Ç
        4'b1001:alu_ctr = 3'b001;//Òì»ò
        4'b1010:alu_ctr = 3'b110;//seb
        4'b1011:alu_ctr = 3'b110;//seh
        4'b1110:alu_ctr = 3'b111;//ŒÓ·š(¿É²úÉúÒç³ö£©
        4'b1111:alu_ctr = 3'b111;//Œõ·š(¿É²úÉúÒç³ö£©
        default:alu_ctr = 3'b111;
        endcase
    end
endmodule