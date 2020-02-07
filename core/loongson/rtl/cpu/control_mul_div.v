`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/26 22:08:47
// Design Name: 
// Module Name: control_mul_div
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


module control_mul_div(
		input 				clk_i,
		input 				reset_i,
		input 				if_stall_i,
		input 				ex_stall_i,
		input 				mem_stall_i,
		input[31:0]			mul_div_result_i,

		output reg 			mul_div_en_o,
		output reg 			mul_div_result_sel_o,
		output reg[31:0] 	mul_div_result_o
	);
//select
parameter sel_this_module = 0,
sel_muldiv = 1;

//FSM
parameter idle = 0,
in_ex_stall = 1,
out_ex_stall = 2;

	reg[1:0]		muldiv_fsm;
	wire			non_stall;

	assign non_stall = !(if_stall_i | ex_stall_i | mem_stall_i);

	//fsm transform
 	always@(negedge clk_i) begin
 		if (reset_i == 1'b1) begin
 			muldiv_fsm <= idle;
 			mul_div_result_o <= 32'h0;
 		end
 		else if (muldiv_fsm == idle) begin
 			if (ex_stall_i == 1'b1) begin
 				muldiv_fsm <= in_ex_stall;
 			end
 			else begin
 				muldiv_fsm <= idle;
 			end
 		end
 		else if (muldiv_fsm == in_ex_stall) begin
 			if (non_stall == 1'b1) begin
 				muldiv_fsm <= idle;
 			end
 			else if (ex_stall_i == 1'b0 && (if_stall_i == 1'b1 || mem_stall_i == 1'b1)) begin
 				muldiv_fsm <= out_ex_stall;
 				mul_div_result_o <= mul_div_result_i;
 			end
 			else begin
 				muldiv_fsm <= in_ex_stall;
 			end
 		end
 		else if (muldiv_fsm == out_ex_stall) begin
 			if (non_stall == 1'b1) begin
 				muldiv_fsm <= idle;
 			end
 			else begin
 				muldiv_fsm <= out_ex_stall;
 			end
 		end
 		else begin
 			muldiv_fsm <= idle;
 		end
 	end

 	//output
 	always@(*) begin
 		case(muldiv_fsm)
 			idle: begin
 				mul_div_en_o = 1'b1;
 				mul_div_result_sel_o = sel_muldiv;
 			end
 			in_ex_stall: begin
 				mul_div_en_o = 1'b1;
 				mul_div_result_sel_o = sel_muldiv;
 			end
 			out_ex_stall: begin
 				mul_div_en_o = 1'b0;
 				mul_div_result_sel_o = sel_this_module;
 			end
 		endcase
 	end

endmodule
