`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/21 15:52:44
// Design Name: 
// Module Name: Ext_unit
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

module Ext_unit(
    input [15:0] ifid_imm,
    input [1:0] id_imm_ext,
    output reg [31:0] imm_ext
    );

    parameter UNSIGN_EXT = 0;
    parameter SIGN_EXT   = 1;
    parameter LUI        = 2;
    parameter CONST_4    = 3;

    always @(*) begin
        case (id_imm_ext)
        SIGN_EXT: imm_ext = { {16{ifid_imm[15]}}, ifid_imm};
        UNSIGN_EXT: imm_ext = { {16{1'b0}}, ifid_imm };
        LUI: imm_ext = { ifid_imm, 16'd0 };
        CONST_4: imm_ext = 32'd1;  // (ex_imm_ext << 2) == 4
        endcase
    end

endmodule
