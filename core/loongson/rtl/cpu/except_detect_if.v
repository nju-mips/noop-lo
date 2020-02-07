`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 16:00:38
// Design Name: 
// Module Name: except_detect_if
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

`include "excepttions.vh"

module except_detect_if(
		input [31:0]		pc_i,
		output reg[31:0]	excepttype_o
    );
	always@(*) begin
		excepttype_o = 32'h00000000;	
	end

endmodule
