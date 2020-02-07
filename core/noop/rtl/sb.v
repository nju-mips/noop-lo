`include "common.vh"
`include "scoreboard.vh"

module sb(
	input clk,
	input rst,
	input valid,
	input flush,
	input[`DATA_WIDTH-1:0]			src1_value,
	input[`DATA_WIDTH-1:0]			src2_value,

	input[`REGBIT-1:0] 				dst,
	input[`REGBIT-1:0]				src1,
	input[`REGBIT-1:0]				src2,

	input issue2alu,
	input issue2bru,
	input issue2lsu,
	input issue2mdu,
	// forward data
	input[`DATA_WIDTH-1:0] 			alu_res,
	input[3:0]						alu_res_byte_wen,
	input[`DATA_WIDTH-1:0] 			bru_res,
	input[3:0]						bru_res_byte_wen,
	input[`DATA_WIDTH-1:0] 			lsu_res,
	input[3:0]						lsu_res_byte_wen,
	input[`DATA_WIDTH-1:0] 			mdu_res,
	input[3:0]						mdu_res_byte_wen,

	// function unit is busy or not
	input alu_ready,
	input bru_ready,
	input lsu_ready,
	input mdu_ready,

	//input wbu_done,
	output[`DATA_WIDTH-1:0]			real_src1_value,
	output[`DATA_WIDTH-1:0]			real_src2_value,

	output inst_run
	);

// instruction status
// | dst | src1 | src1_fu | src1_ready | src2 | src2_fu | src2_ready | issue_fu |
// src_ready = src_fu & src_fu_ready || src1_fu == none
// inst_ready = src1_ready & src2_ready

	// queue head = exe, tail = waiting, issue = ready to run ?
	// wire[$clog2(`WINDOWS_SIZE)-1:0] head, tail, issue;

	reg[`inst_status_len-1:0]  exu_insts; 
	wire[`inst_status_len-1:0] cur_insts;

// register status
	// pay attention initial
	// reg[$clog2(`FU_NUM)-1:0] 	 regs[`REGSET_NUM-1:0][`GPR_NUM-1 :0];
	reg[`FUBIT-1:0] 	 	   regs[`REGSUM-1 :0];

// forward data
	wire[`DATA_WIDTH-1:0] 	   forward_data[`FU_NUM-1:0];
	wire[3:0]				   forward_byte_wen[`FU_NUM-1:0];
	wire[`FU_NUM-1:0] 		   forward_ready;

//function unit
	wire[`FU_NUM-1:0]		   fu_ready;

	assign cur_insts[`dst] = dst;
	assign cur_insts[`src1] = src1;
	assign cur_insts[`src2] = src2;
	assign cur_insts[`src1_fu] = regs[cur_insts[`src1]];
	assign cur_insts[`src2_fu] = regs[cur_insts[`src2]];
	assign cur_insts[`src1_ready] = ((`dst_is_not_gpr_zero(exu_insts) && `has_RAW_src1(exu_insts, cur_insts))? forward_ready[cur_insts[`src1_fu]] : 1'b1);
	assign cur_insts[`src2_ready] = ((`dst_is_not_gpr_zero(exu_insts) && `has_RAW_src2(exu_insts, cur_insts)) ? forward_ready[cur_insts[`src2_fu]] : 1'b1);
	assign cur_insts[`issue_fu] = issue2alu ? `alu : (issue2bru ? `bru : (issue2lsu ? `lsu : (issue2mdu ? `mdu : `none_fu))); 
	
	assign forward_data[`none_fu] = `CONST_DATA_H(0);
	assign forward_data[`alu] = alu_res;
	assign forward_data[`bru] = bru_res;
	assign forward_data[`lsu] = lsu_res;
	assign forward_data[`mdu] = mdu_res;

	assign forward_byte_wen[`none_fu] = 4'b0000;
	assign forward_byte_wen[`alu] = alu_res_byte_wen;
	assign forward_byte_wen[`bru] = bru_res_byte_wen;
	assign forward_byte_wen[`lsu] = lsu_res_byte_wen;
	assign forward_byte_wen[`mdu] = mdu_res_byte_wen;

	assign forward_ready[`none_fu] = 1'b1;
	assign forward_ready[`alu] = alu_ready;
	assign forward_ready[`bru] = bru_ready;
	assign forward_ready[`lsu] = lsu_ready;
	assign forward_ready[`mdu] = mdu_ready;

	assign fu_ready[`none_fu] = 1'b1;
	assign fu_ready[`alu] = alu_ready;
	assign fu_ready[`bru] = bru_ready;
	assign fu_ready[`lsu] = lsu_ready;
	assign fu_ready[`mdu] = mdu_ready;
	
	assign real_src1_value = `dst_is_not_gpr_zero(exu_insts) && `has_RAW_src1(exu_insts, cur_insts) ? 
				`get_forward_data(forward_data[cur_insts[`src1_fu]], src1_value, forward_byte_wen[cur_insts[`src1_fu]]): src1_value;

	assign real_src2_value = `dst_is_not_gpr_zero(exu_insts) && `has_RAW_src2(exu_insts, cur_insts) ?
				`get_forward_data(forward_data[cur_insts[`src2_fu]], src2_value, forward_byte_wen[cur_insts[`src2_fu]]): src2_value;

	wire cur_ready = cur_insts[`src1_ready] & cur_insts[`src2_ready];
	wire exu_ready = fu_ready[`alu] & fu_ready[`bru] & fu_ready[`lsu] & fu_ready[`mdu]; // OoO :exu_ready = fu_ready[cur_insts[`issue_fu]]? 

	wire hilo_stall = exu_insts[`dst] == `HILORegs && (cur_insts[`src1] == `HIRegs || cur_insts[`src1] == `LORegs);
	reg hilo_run;

	assign inst_run = cur_ready & exu_ready & (hilo_stall ? hilo_run : 1'b1);

	always@(posedge clk) begin
		if(rst) begin
			exu_insts <= 0;
			hilo_run <= 1'b0;
			regs[exu_insts[`dst]] <= `none_fu;
		end
		else begin
			if (hilo_run == 1'b1) begin
				hilo_run <= 1'b0;
			end
			else if(cur_ready & exu_ready & hilo_stall) begin
				hilo_run <= 1'b1;
			end
			
			if(valid & inst_run) begin
				exu_insts <= cur_insts;
				regs[exu_insts[`dst]] <= `none_fu;
				if(`dst_is_not_gpr_zero(cur_insts)) begin
					regs[cur_insts[`dst]] <= cur_insts[`issue_fu];
				end
			end
			else if(exu_ready) begin
				regs[exu_insts[`dst]] <= `none_fu;
				exu_insts <= 0;
			end
		end
	end

endmodule