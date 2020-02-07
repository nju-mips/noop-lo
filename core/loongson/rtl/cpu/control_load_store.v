`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/25 22:12:34
// Design Name: 
// Module Name: control_load_store
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


module control_load_store(
		input 				clk_i,
		input 				reset_i,
		input 				if_stall_i,
		input 				ex_stall_i,
		input 				mem_stall_i,
		input[31:0]			load_data_i,

		output reg 			load_en_o,
		output reg			store_en_o,
		output reg			load_data_sel_o,
		output reg[31:0] 	load_data_o
	);
//select
parameter sel_this_module = 0,
sel_cache = 1;


//FSM
parameter 	idle = 0,
in_mem_stall = 1,
out_mem_stall = 2;

		reg[1:0]		mem_fsm;
		wire 			non_stall;
		assign non_stall = !(if_stall_i | ex_stall_i | mem_stall_i);

		initial begin
			mem_fsm 	= idle;
			load_data_o = 32'h0;
		end

		//fsm transform
		always@(posedge clk_i) begin
			if (reset_i == 1'b1) begin
				mem_fsm 	<= idle;
				load_data_o <= 32'h0;
			end
			else if (mem_fsm == idle) begin
				if (mem_stall_i == 1'b1) begin
					mem_fsm <= in_mem_stall;
				end
				else begin
					mem_fsm <= idle;
				end
			end
			else if (mem_fsm == in_mem_stall) begin
				if (non_stall == 1'b1) begin
					mem_fsm <= idle;
				end
				else if (mem_stall_i == 1'b0 && (ex_stall_i == 1'b1 || if_stall_i == 1'b1)) begin
					mem_fsm <= out_mem_stall;
					load_data_o <= load_data_i;
				end
				else begin
					mem_fsm <= in_mem_stall;
				end
			end
			else if (mem_fsm == out_mem_stall) begin
				if (non_stall == 1'b1) begin
					mem_fsm <= idle;
				end
				else begin
					mem_fsm <= out_mem_stall;
				end
			end
			else begin
				mem_fsm <= idle;
			end
		end

		//output
		always@(*) begin
			case(mem_fsm)
				idle: begin
					load_en_o = 1'b1;
					store_en_o = 1'b1;
					load_data_sel_o = sel_cache;
				end
				in_mem_stall: begin
					load_en_o = 1'b1;
					store_en_o = 1'b1;
					load_data_sel_o = sel_cache;
				end
				out_mem_stall: begin
					load_en_o = 1'b0;
					store_en_o = 1'b0;
					load_data_sel_o = sel_this_module;
				end
                default: begin
                    load_en_o = 1'b1;
                    store_en_o = 1'b1;
                    load_data_sel_o = sel_cache;
                end
			endcase
		end


endmodule
