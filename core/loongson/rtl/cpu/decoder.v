`timescale 1ns / 1ps

module decoder(
	input [31 : 0]						ifid_instr,
	
	// enable or disenable
	output reg							idex_mem_w_en,
	output reg							idex_mem_r_en,
	output reg							idex_reg_w_en,
	output reg							idex_of_w_disen,
	output reg							idex_cp0_w_en,
	
	//others
	output reg							idex_jump,
	output reg							idex_branch,
	output reg [2 : 0]					idex_condition,
	output reg [4 : 0]					idex_shamt,
	output reg [1 : 0]					idex_imm_ext,
	
	// opcode
	output reg [3 : 0]					idex_ALU_op, 
	output reg [1 : 0]					idex_shift_op,
	output reg [3 : 0]					idex_md_op,
	
	// specific instruction
	output reg							idex_syscall,
	output reg							idex_eret,
	output reg							idex_jr,
	output reg							idex_movn,
	output reg							idex_movz,
	output reg							idex_nop,
	output reg							idex_trap,
	output reg							idex_invalid,
	output reg 							idex_break,
	
	// selection
	output reg							idex_B_sel,
	output reg							idex_shamt_sel,
	output reg [2 : 0]					idex_load_sel,
	output reg [2 : 0]					idex_store_sel,  
	output reg [2 : 0]					idex_exres_sel,
	output reg							idex_rt_data_sel,
	output reg [1 : 0]					idex_rd_addr_sel,
	output reg							idex_rt_addr_sel,
	
	// register addr
	output reg [4 : 0]					idex_cp0_src_addr,
	output reg [4 : 0]					idex_cp0_dest_addr
	);

    
    
    
	always @ (ifid_instr) begin
		// ADD
		if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b1110;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b1;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

        // NOP
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[25 : 6] == 20'b00000000000000000000) &&
			(ifid_instr[5 : 0] == 6'b000000)) begin
				idex_cp0_src_addr = 5'b0;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b1;
				idex_break = 1'b0;                
                
                
		// ADDU
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// ADDI
		end else if(ifid_instr[31 : 26] == 6'b001000) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b1110;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b1;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// ADDIU
		end else if(ifid_instr[31 : 26] == 6'b001001) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SUB
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b1111;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b1;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SUBU
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// AND
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100100)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0100;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// ANDI
		end else if(ifid_instr[31 : 26] == 6'b001100) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0100;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// OR
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100101)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0110;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// ORI
		end else if(ifid_instr[31 : 26] == 6'b001101) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0110;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// XOR
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100110)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b1001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// XORI
		end else if(ifid_instr[31 : 26] == 6'b001110) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b1001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// NOR
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100111)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b1000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SLT
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b101010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0101;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SLTU
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b101011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0111;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SLTI
		end else if(ifid_instr[31 : 26] == 6'b001010) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0101;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SLTIU
		end else if(ifid_instr[31 : 26] == 6'b001011) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0111;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SLL
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[25 : 21] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b000000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = ifid_instr[10:6];
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b001;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SLLV
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b000100)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b1;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b001;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SRL
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[25 : 21] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b000010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = ifid_instr[10:6];
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b01;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b001;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SRLV
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b000110)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b1;
				idex_shift_op = 2'b01;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b001;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SRA
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[25 : 21] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b000011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = ifid_instr[10:6];
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b10;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b001;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SRAV
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b000111)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b1;
				idex_shift_op = 2'b10;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b001;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// CLO
		end else if((ifid_instr[31 : 26] == 6'b011100) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0011;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// CLZ
		end else if((ifid_instr[31 : 26] == 6'b011100) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b100000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0010;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

				
				
				
		// SEB
		end else if((ifid_instr[31 : 26] == 6'b011111) &&
			(ifid_instr[25:21] == 5'b00000) &&
			(ifid_instr[10 : 6] == 5'b10000) &&
			(ifid_instr[5 : 0] == 6'b100000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b1010;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;		
				
		// SEH
		end else if((ifid_instr[31 : 26] == 6'b011111) &&
			(ifid_instr[25:21] == 5'b00000) &&
			(ifid_instr[10 : 6] == 5'b11000) &&
			(ifid_instr[5 : 0] == 6'b100000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b1011;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;		
				
				
		// BAL
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			 (ifid_instr[25 : 21] == 5'b00000) &&
			 (ifid_instr[20 : 16] == 5'b10001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b1;
				idex_condition = 3'b111;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b111;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b10;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;
				
		// BGEZAL
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			 (ifid_instr[20 : 16] == 5'b10001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b1;
				idex_condition = 3'b011;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b111;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b10;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;


		// BLTZAL
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			 (ifid_instr[20 : 16] == 5'b10000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b1;
				idex_condition = 3'b110;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b111;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b10;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

				
		// BEQ
		end else if(ifid_instr[31 : 26] == 6'b000100) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b001;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// BEQL
		end else if(ifid_instr[31 : 26] == 6'b010100) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b001;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// BGEZ
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b00001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b011;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// BGTZ
		end else if((ifid_instr[31 : 26] == 6'b000111) &&
			(ifid_instr[20 : 16] == 5'b00000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b100;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// BLEZ
		end else if((ifid_instr[31 : 26] == 6'b000110) &&
			(ifid_instr[20 : 16] == 5'b00000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b101;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// BLTZ
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b00000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b110;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// BNE
		end else if(ifid_instr[31 : 26] == 6'b000101) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b010;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TEQ
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b110100)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b001;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TEQI
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b01100)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b001;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TGE
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b110000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b011;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TGEI
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b01000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b011;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TGEU
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b110001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b011;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0111;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TGEIU
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b01001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b011;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0111;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TLT
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b110010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b110;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TLTI
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b01010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b110;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TLTU
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b110011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b110;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0111;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TLTIU
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b01011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b110;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0111;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TNE
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b110110)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b010;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// TNEI
		end else if((ifid_instr[31 : 26] == 6'b000001) &&
			(ifid_instr[20 : 16] == 5'b01110)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b010;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b1;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// J
		end else if(ifid_instr[31 : 26] == 6'b000010) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b1;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// JAL
		end else if(ifid_instr[31 : 26] == 6'b000011) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b1;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				//idex_exres_sel = 3'b010;
				// Now it goes through the same datapath with BAL 
				idex_exres_sel = 3'b111;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				//idex_imm_ext = 2'b11;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b10;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// JALR
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[20 : 16] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b001001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b1;
				idex_condition = 3'b111;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b1;
				idex_exres_sel = 3'b111;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// JR
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[20 : 11] == 10'b0000000000) &&
			(ifid_instr[5 : 0] == 6'b001000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b1;
				idex_condition = 3'b111;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b1;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b1;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MOVN
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b001011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b011;
				idex_movn = 1'b1;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MOVZ
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b001010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0001;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b011;
				idex_movn = 1'b0;
				idex_movz = 1'b1;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LUI
		end else if((ifid_instr[31 : 26] == 6'b001111) &&
			(ifid_instr[25 : 21] == 5'b00000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b10;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MUL
		end else if((ifid_instr[31 : 26] == 6'b011100) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b000010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0111;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MULT
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[15 : 6] == 10'b0000000000) &&
			(ifid_instr[5 : 0] == 6'b011000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b1000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MULTU
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[15 : 6] == 10'b0000000000) &&
			(ifid_instr[5 : 0] == 6'b011001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b1001;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// DIV
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[15 : 6] == 10'b0000000000) &&
			(ifid_instr[5 : 0] == 6'b011010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0001;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// DIVU
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[15 : 6] == 10'b0000000000) &&
			(ifid_instr[5 : 0] == 6'b011011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0010;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MFHI
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[25 : 16] == 10'b0000000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b010000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0011;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MTHI
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[20 : 6] == 15'b000000000000000) &&
			(ifid_instr[5 : 0] == 6'b010001)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0101;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MFLO
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[25 : 16] == 10'b0000000000) &&
			(ifid_instr[10 : 6] == 5'b00000) &&
			(ifid_instr[5 : 0] == 6'b010010)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b01;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0100;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MTLO
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[20 : 6] == 15'b000000000000000) &&
			(ifid_instr[5 : 0] == 6'b010011)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b100;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0110;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LB
		end else if(ifid_instr[31 : 26] == 6'b100000) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b1;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LBU
		end else if(ifid_instr[31 : 26] == 6'b100100) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b1;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b001;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LH
		end else if(ifid_instr[31 : 26] == 6'b100001) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b1;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b010;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LHU
		end else if(ifid_instr[31 : 26] == 6'b100101) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b1;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b011;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LW
		end else if(ifid_instr[31 : 26] == 6'b100011) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b1;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b100;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SB
		end else if(ifid_instr[31 : 26] == 6'b101000) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b1;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SH
		end else if(ifid_instr[31 : 26] == 6'b101001) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b1;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b001;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SW
		end else if(ifid_instr[31 : 26] == 6'b101011) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b1;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b010;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LWL
		end else if(ifid_instr[31 : 26] == 6'b100010) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b1;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b101;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// LWR
		end else if(ifid_instr[31 : 26] == 6'b100110) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b1;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b110;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SWL
		end else if(ifid_instr[31 : 26] == 6'b101010) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b1;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b011;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SWR
		end else if(ifid_instr[31 : 26] == 6'b101110) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b1;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b1;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b100;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b01;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MFC0
		end else if((ifid_instr[31 : 26] == 6'b010000) &&
			(ifid_instr[25 : 21] == 5'b00000) &&
			(ifid_instr[10 : 3] == 8'b00000000)) begin
				idex_cp0_src_addr = ifid_instr[15:11];
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b1;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b0;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// MTC0
		end else if((ifid_instr[31 : 26] == 6'b010000) &&
			(ifid_instr[25 : 21] == 5'b00100) &&
			(ifid_instr[10 : 3] == 8'b00000000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = ifid_instr[15:11];
				idex_cp0_w_en = 1'b1;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b1;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// SYSCALL
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b001100)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b1;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// ERET
		end else if((ifid_instr[31 : 26] == 6'b010000) &&
			(ifid_instr[25 : 6] == 20'b10000000000000000000) &&
			(ifid_instr[5 : 0] == 6'b011000)) begin
				idex_cp0_src_addr = 5'b00000;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b1;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;

		// BREAK
		end else if((ifid_instr[31 : 26] == 6'b000000) &&
			(ifid_instr[5 : 0] == 6'b001101)) begin
				idex_cp0_src_addr = 5'b0;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b0;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b1;  

		
				

		// invalid instructions
		end else begin
				idex_cp0_src_addr = 5'b0;
				idex_jump = 1'b0;
				idex_mem_w_en = 1'b0;
				idex_mem_r_en = 1'b0;
				idex_reg_w_en = 1'b0;
				idex_branch = 1'b0;
				idex_condition = 3'b000;
				idex_B_sel = 1'b0;
				idex_ALU_op = 4'b0000;
				idex_shamt = 5'b00000;
				idex_shamt_sel = 1'b0;
				idex_shift_op = 2'b00;
				idex_load_sel = 3'b000;
				idex_store_sel = 3'b000;
				idex_of_w_disen = 1'b0;
				idex_cp0_dest_addr = 5'b00000;
				idex_cp0_w_en = 1'b0;
				idex_syscall = 1'b0;
				idex_eret = 1'b0;
				idex_jr = 1'b0;
				idex_exres_sel = 3'b000;
				idex_movn = 1'b0;
				idex_movz = 1'b0;
				idex_rt_data_sel = 1'b1;
				idex_imm_ext = 2'b00;
				idex_rd_addr_sel = 2'b00;
				idex_rt_addr_sel = 1'b0;
				idex_invalid = 1'b1;
				idex_trap = 1'b0;
				idex_md_op = 4'b0000;
				idex_nop = 1'b0;
				idex_break = 1'b0;
		end
	end

endmodule
