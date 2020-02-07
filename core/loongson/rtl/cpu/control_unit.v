`include "excepttions.vh"

`define		pc_j_jal			0  
`define		pc_except			1
`define 	pc_eret				2
`define		pc_control_hazard 	3
`define		pc_append_4			4
`define     pc_bp               5
`define 	except_new_pc		32'hBFC00380
`define 	interrupt_new_pc	32'hBFC00380

module control_unit(
	input			reset,
	input			id_jmp,
	input 			mem_jr,       
	input			mem_branch_state,
	//input			mem_stall,
	input[31:0]		mem_excepttype,
	input			idex_mem_r,
	input[4:0]		ifid_rs_addr,
	input[4:0]		ifid_real_rt_addr,
	input[4:0]		idex_real_rd_addr,

	input			if_stall_i,
	input 			ex_stall_i,
	input 			mem_stall_i,
	input 			mem_is_load_i,
	input 			mem_is_store_i,

	output			reg cu_pc_stall,
	output 		    reg cu_ifid_stall,
	output			reg cu_idex_stall,
	output			reg cu_exmem_stall,
	output			reg cu_memwb_stall,
	output 			reg cu_except_handle,

	output			reg cu_ifid_flush,
	output			reg cu_idex_flush,
	output			reg cu_exmem_flush,
	output reg [2:0]	cu_pc_src,
	output reg [31:0]	cu_vector,
    
    input bp_error,
    input bp_result
	);

	wire	is_except, is_mem_branch, is_stall, is_int;

	assign is_stall  = if_stall_i | ex_stall_i | mem_stall_i;
	assign is_except = mem_excepttype[4] | mem_excepttype[3] & (mem_excepttype[2] | mem_excepttype[1] | mem_excepttype[0]);
	assign is_int	 = (!mem_excepttype[3] & (mem_excepttype[2] | mem_excepttype[1] | mem_excepttype[0])) | (mem_excepttype[3] & !mem_excepttype[2] & !mem_excepttype[1] & !mem_excepttype[0]);
	assign is_mem_branch = mem_jr | mem_branch_state;

	always@(*) begin
		if(reset == 1'b1) begin
			cu_pc_stall			=		1'b0;
			cu_ifid_stall		=		1'b0;
			cu_idex_stall		=		1'b0;
			cu_exmem_stall		=		1'b0;
			cu_memwb_stall		=		1'b0;
			cu_ifid_flush 		= 		1'b1; 
			cu_idex_flush		=		1'b1;
			cu_exmem_flush 		= 		1'b1;
			cu_pc_src 			= 		`pc_append_4; 
			cu_vector			=		32'h0;
			cu_except_handle	=		1'b0;
			
		end
		else begin
			//各类stall，这些stall不能被打断
			//否则可能出现数据丢失（串口、键盘缓冲等）
			if( is_stall == 1'b1) begin
					cu_pc_stall			=		1'b1;
					cu_ifid_stall		=		1'b1;
					cu_idex_stall		=		1'b1;
					cu_exmem_stall		=		1'b1;
					cu_memwb_stall		=		1'b1;
					cu_ifid_flush		=		1'b0;
					cu_idex_flush		=		1'b0;
					cu_exmem_flush		=		1'b0;
					cu_pc_src 			= 		`pc_append_4; 
					cu_vector			=		32'h0;
					cu_except_handle	=		1'b0;
				
			end
			//中断异常处理
			else if(mem_excepttype != 32'h0) begin
				//int需要判断是不是之前有东西load出来了
				if (mem_is_load_i == 1'b1 && is_int == 1'b1) begin
					cu_pc_stall			=		1'b1;
					cu_ifid_stall		=		1'b0;
					cu_idex_stall		=		1'b0;
					cu_exmem_stall		=		1'b0;
					cu_memwb_stall		=		1'b0;
					cu_ifid_flush		=		1'b1;
					cu_idex_flush		=		1'b0;
					cu_exmem_flush		=		1'b0;
					cu_pc_src 			= 		`pc_append_4; 
					cu_vector			=		32'h0;
					cu_except_handle	=		1'b0;
				end
				else begin
					if (is_except == 1'b1) begin
						//excepttion
						if (mem_excepttype == `encode_eret) begin
							//eret
							cu_pc_stall			=		1'b0;
							cu_ifid_stall		=		1'b0;
							cu_idex_stall		=		1'b0;
							cu_exmem_stall		=		1'b0;
							cu_memwb_stall		=		1'b1;
							cu_ifid_flush		=		1'b1;
							cu_idex_flush		=		1'b1;
							cu_exmem_flush		=		1'b1;
							cu_pc_src			=		`pc_eret;
							//not used
							cu_vector 			= 		`except_new_pc;
							cu_except_handle	=		1'b1;
						end
						else begin
							//except without eret
							cu_pc_stall			=		1'b0;
							cu_ifid_stall		=		1'b0;
							cu_idex_stall		=		1'b0;
							cu_exmem_stall		=		1'b0;
							cu_memwb_stall		=		1'b1;
							cu_ifid_flush		=		1'b1;
							cu_idex_flush		=		1'b1;
							cu_exmem_flush		=		1'b1;
							cu_pc_src			=		`pc_except;
							cu_vector 			= 		`except_new_pc;
							cu_except_handle	=		1'b1;
						end
					end
					else begin
						//interruptions
						cu_pc_stall			=		1'b0;
						cu_ifid_stall		=		1'b0;
						cu_idex_stall		=		1'b0;
						cu_exmem_stall		=		1'b0;
						cu_memwb_stall		=		1'b1;
						cu_ifid_flush		=		1'b1;
						cu_idex_flush		=		1'b1;
						cu_exmem_flush		=		1'b1;
						cu_pc_src			=		`pc_except;
						cu_vector 			= 		`interrupt_new_pc;
						cu_except_handle	=		1'b1;
					end
	            end

			end
			else begin
				//分支处理，控制异??
				if(bp_error == 1'b1) begin
					cu_pc_stall			=		1'b0;
					cu_ifid_stall		=		1'b0;
					cu_idex_stall		=		1'b0;
					cu_exmem_stall		=		1'b0;
					cu_memwb_stall		=		1'b0;
					cu_ifid_flush		=		1'b1;
					cu_idex_flush		=		1'b1;
					cu_exmem_flush		=		1'b0;
					cu_vector			=		32'h0;
					cu_pc_src 			= 	`pc_control_hazard;
					cu_except_handle	=		1'b0;
				end
				else if(mem_jr == 1'b1) begin
					cu_pc_stall			=		1'b0;
					cu_ifid_stall		=		1'b0;
					cu_idex_stall		=		1'b0;
					cu_exmem_stall		=		1'b0;
					cu_memwb_stall		=		1'b0;
					cu_ifid_flush		=		1'b1;
					cu_idex_flush		=		1'b1;
					cu_exmem_flush		=		1'b0;
					cu_vector			=		32'h0;
					cu_pc_src 			= `pc_control_hazard;
					cu_except_handle	=		1'b0;
				end
				else if(id_jmp == 1'b1) begin
					cu_pc_stall			=		1'b0;
					cu_ifid_stall		=		1'b0;
					cu_idex_stall		=		1'b0;
					cu_exmem_stall		=		1'b0;
					cu_memwb_stall		=		1'b0;
					cu_ifid_flush		=		1'b0;
					cu_idex_flush		=		1'b0;
					cu_exmem_flush		=		1'b0;
					cu_vector			=		32'h0;
					cu_pc_src 			= `pc_j_jal;
					cu_except_handle	=		1'b0;

				end
                else if(bp_result == 1'b1) begin
					cu_pc_stall			=		1'b0;
					cu_ifid_stall		=		1'b0;
					cu_idex_stall		=		1'b0;
					cu_exmem_stall		=		1'b0;
					cu_memwb_stall		=		1'b0;
					cu_ifid_flush		=		1'b0;
					cu_idex_flush		=		1'b0;
					cu_exmem_flush		=		1'b0;
					cu_vector			=		32'h0;
					cu_pc_src 			= `pc_bp;
					cu_except_handle	=		1'b0;

				end
				else if( idex_mem_r == 1'b1 && (ifid_rs_addr == idex_real_rd_addr || ifid_real_rt_addr == idex_real_rd_addr) ) begin
					//load-use 冒险处理
					cu_pc_stall			=		1'b1;
					cu_ifid_stall		=		1'b1;
					cu_idex_stall		=		1'b0;
					cu_exmem_stall		=		1'b0;
					cu_memwb_stall		=		1'b0;
					cu_ifid_flush		=		1'b0;
					cu_idex_flush		=		1'b1;
					cu_exmem_flush		=		1'b0;
					cu_pc_src 			= 		`pc_append_4; 
					cu_vector			=		32'h0;
					cu_except_handle	=		1'b0;
				end
				else begin
					//正常执行
					cu_pc_stall			=		1'b0;
					cu_ifid_stall		=		1'b0;
					cu_idex_stall		=		1'b0;
					cu_exmem_stall		=		1'b0;
					cu_memwb_stall		=		1'b0;
					cu_ifid_flush		=		1'b0;
					cu_idex_flush		=		1'b0;
					cu_exmem_flush		=		1'b0;
					cu_pc_src 			= 		`pc_append_4; 
					cu_vector			=		32'h0;
					cu_except_handle	=		1'b0;
				end
			end
		end
	end

endmodule



