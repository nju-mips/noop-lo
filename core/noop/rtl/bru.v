`include "decode.vh"
`include "common.vh"
`include "exception.vh"
`include "flush.vh"

module bru #(
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
	`msg_slave_if(ISU_BRU_datain),
	`msg_master_if(BRU_WBU_res),

	`msg_slave_if(WBU_BRU_flush),
	`msg_master_if(BRU_ISU_forward)
);
	// pipeline
	`pipeline_msg_reg(ISU_BRU_datain);
	`pipeline_msg_reg(WBU_BRU_flush);

	// flush
	`msglen_wire(WBU_BRU_flush, kind, flush_kind);
	`msglen_wire(WBU_BRU_flush, branch_id, flush_branch_id);
	`msglen_wire(ISU_BRU_datain, is_delayslot, is_delayslot);
	`msglen_wire(ISU_BRU_datain, branch_id, branch_id);

	`pipeline_msg_get(WBU_BRU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_BRU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(ISU_BRU_datain, is_delayslot, is_delayslot);
	`pipeline_msg_get(ISU_BRU_datain, branch_id, branch_id);

    wire flushed;
    reg flush_cond_true;
	`flush_judge(flush_cond_true, flush_kind, is_delayslot, branch_id, flush_branch_id);

	always@(posedge clk) begin
		if(!flushed | S_ISU_BRU_datain_tready) begin
			`pipeline_msg_get_reg(WBU_BRU_flush)
		end
	end

	// control
	// value: 
	//        nop :     P_valid = 1'b0   (rst| ....)
	//        flushed : inst be flushed
	//        passed :  send value to next unit

    wire nop;
	reg passed;
	assign flushed = flush_cond_true & P_WBU_BRU_flush_valid;
	assign nop = !P_ISU_BRU_datain_valid;


	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(ISU_BRU_datain)
		`pipeline_msg_else
			if(S_ISU_BRU_datain_tready) begin
				`pipeline_msg_get_reg(ISU_BRU_datain)
				passed <= 1'b0;
			end
			else if (M_BRU_WBU_res_tvalid & M_BRU_WBU_res_tready) begin
				passed <= 1'b1;
			end
		`pipeline_msg_get_end
	end
	assign S_ISU_BRU_datain_tready = M_BRU_WBU_res_tvalid & M_BRU_WBU_res_tready | nop | passed | flushed;

	assign M_BRU_WBU_res_tvalid = P_ISU_BRU_datain_valid & !flushed;

	`msglen_wire(ISU_BRU_datain, A, A);
	`msglen_wire(ISU_BRU_datain, B, B);
	`msglen_wire(ISU_BRU_datain, PC, PC);
	`msglen_wire(ISU_BRU_datain, offset, offset);
	`msglen_wire(ISU_BRU_datain, fu_op, op);
	`msglen_wire(ISU_BRU_datain, rd, rd);
	`msglen_wire(ISU_BRU_datain, ETW, old_etw);

	`msglen_wire(ISU_BRU_datain, ETW, new_etw);


	`pipeline_msg_get(ISU_BRU_datain, A, A);
	`pipeline_msg_get(ISU_BRU_datain, B, B);
	`pipeline_msg_get(ISU_BRU_datain, PC, PC);
	`pipeline_msg_get(ISU_BRU_datain, offset, offset);
	`pipeline_msg_get(ISU_BRU_datain, fu_op, op);
	`pipeline_msg_get(ISU_BRU_datain, rd, rd);
	`pipeline_msg_get(ISU_BRU_datain, ETW, old_etw);

	wire [15:0] imm = offset[15:0];
	wire [31:0] ext_imm = {{14{imm[15]}}, imm, 2'b00};

	`msglen_reg(BRU_WBU_res, target, target);
	always@(*) begin
		case(op)
			`FU_OP_BRU_J:   target = {PC[31:28], offset, 2'b00};
			`FU_OP_BRU_JAL: target = {PC[31:28], offset, 2'b00};
			`FU_OP_BRU_JR:  target = A;
			`FU_OP_BRU_JALR:target = A;
			`FU_OP_BRU_BNE: target = PC + ext_imm + `CONST_DATA_D(4);
			`FU_OP_BRU_BEQ: target = PC + ext_imm + `CONST_DATA_D(4);
			`FU_OP_BRU_BGEZ: target = PC + ext_imm + `CONST_DATA_D(4);
			`FU_OP_BRU_BGTZ: target = PC + ext_imm + `CONST_DATA_D(4);
			`FU_OP_BRU_BLEZ: target = PC + ext_imm + `CONST_DATA_D(4);
			`FU_OP_BRU_BLTZ: target = PC + ext_imm + `CONST_DATA_D(4);
			`FU_OP_BRU_BGEZAL: target = PC + ext_imm + `CONST_DATA_D(4);
			`FU_OP_BRU_BLTZAL: target = PC + ext_imm + `CONST_DATA_D(4); 
			`FU_OP_BRU_ERET: target = A;
			default: target = `CONST_DATA_D(0);
		endcase
	end

	`msglen_reg(BRU_WBU_res, is_taken, is_taken);
	always@(*) begin
		case(op)
			`FU_OP_BRU_J:   is_taken = 1'b1;
			`FU_OP_BRU_JAL: is_taken = 1'b1;
			`FU_OP_BRU_JR:  is_taken = 1'b1;
			`FU_OP_BRU_JALR:is_taken = 1'b1;
			`FU_OP_BRU_BNE: is_taken = (A != B);
			`FU_OP_BRU_BEQ: is_taken = (A == B);
			`FU_OP_BRU_BGEZ: is_taken = ($signed(A) >= 0);
			`FU_OP_BRU_BGTZ: is_taken = ($signed(A) > 0);
			`FU_OP_BRU_BLEZ: is_taken = ($signed(A) <= 0);
			`FU_OP_BRU_BLTZ: is_taken = ($signed(A) < 0);
			`FU_OP_BRU_BGEZAL: is_taken = ($signed(A) >= 0);
			`FU_OP_BRU_BLTZAL: is_taken = ($signed(A) < 0);
			`FU_OP_BRU_ERET: is_taken = 1'b1;
			default: is_taken = 1'b0;
		endcase
	end


	`msglen_wire(BRU_WBU_res, val, val);
	// `msglen_wire(BRU_WBU_res, rd, rd);
	`msglen_wire(BRU_WBU_res, rd_wen, rd_wen);

	assign val = PC + `CONST_DATA_D(8);
	// assign rd = (op == `FU_OP_BRU_JALR) ? jalr_rd : `CONST_ADDR_D(31);
	assign rd_wen = (op == `FU_OP_BRU_JAL) || (op == `FU_OP_BRU_JALR) ||
	                (op == `FU_OP_BRU_BGEZAL) || (op == `FU_OP_BRU_BLTZAL);

	`msg_put(BRU_ISU_forward, val, val);
	`msg_put(BRU_ISU_forward, rd_byte_wen, {4{rd_wen}});
	assign M_BRU_ISU_forward_tvalid  = P_ISU_BRU_datain_valid;

	`msg_put(BRU_WBU_res, target, target);
	`msg_put(BRU_WBU_res, is_taken, is_taken);
	`msg_put(BRU_WBU_res, val, val);
	`msg_put(BRU_WBU_res, rd, rd);
	`msg_put(BRU_WBU_res, rd_wen, rd_wen);

    `ET_Append1(new_etw, old_etw, `ET_AdEL_IF, (target[1] | target[0]) & is_taken);
	//assign new_etw = old_etw;

	`msg_put(BRU_WBU_res, PC, PC);
	`msg_put(BRU_WBU_res, is_delayslot, is_delayslot);
	`msg_put(BRU_WBU_res, branch_id, branch_id);
	`msg_put(BRU_WBU_res, ETW, new_etw);

endmodule
