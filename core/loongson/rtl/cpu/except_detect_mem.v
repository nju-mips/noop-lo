`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/29 15:58:45
// Design Name: 
// Module Name: except_detect_mem
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

module except_detect_mem(
		input [31:0]		excepttype_i,
		input [31:0]		access_addr_i,
		input 				load_en_i,
		input 				store_en_i,
		input [2:0]			load_sel_i,
		input [2:0]			store_sel_i,
		input [31:0]		branch_target,
		input               branch_state,

		output reg[31:0]		excepttype_o
	);

	always @(*) begin
		excepttype_o = excepttype_i;
		// load
		 if (load_en_i == 1'b1) begin
		 	if (load_sel_i[2]) begin
		 		// word
		 		if(load_sel_i == 3'b100 && (access_addr_i[1] | access_addr_i[0])) begin
		 			excepttype_o[`bit_AdEL_ld] = 1'b1;
		 		end
		 		else begin
		 			excepttype_o[`bit_AdEL_ld] = 1'b0;
		 		end
		 	end
		 	else if (load_sel_i[1]) begin
		 		// half word
		 		if(access_addr_i[0]) begin
		 			excepttype_o[`bit_AdEL_ld] = 1'b1;
		 		end
		 		else begin
		 			excepttype_o[`bit_AdEL_ld] = 1'b0;
		 		end
		 	end
		 	else begin
		 		excepttype_o[`bit_AdEL_ld] = 1'b0;
		 	end
		 end
		 else begin
		 	excepttype_o[`bit_AdEL_ld] = 1'b0;
		 end

		 //store
		 if (store_en_i == 1'b1) begin
	 		// word
	 		if(store_sel_i == 3'b010 && (access_addr_i[1] | access_addr_i[0])) begin
	 			excepttype_o[`bit_AdES] = 1'b1;
	 		end
	 		// half word
	 		else if (store_sel_i == 3'b001 && access_addr_i[0]) begin
	 			excepttype_o[`bit_AdES] = 1'b1;
	 		end
		 	else begin
		 		excepttype_o[`bit_AdES] = 1'b0;
		 	end
		 end
		 else begin
		 	excepttype_o[`bit_AdES] = 1'b0;
		 end

		 // pc unaligned
		 if(branch_state & (branch_target[0] | branch_target[1]))
			excepttype_o[`bit_AdEL_if] = 1'b1;
		 else
			excepttype_o[`bit_AdEL_if] = 1'b0;
	end
endmodule
