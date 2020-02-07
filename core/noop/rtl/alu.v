`include "decode.vh"
`include "common.vh"
`include "exception.vh"
`include "flush.vh"

module alu #(
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
	`msg_slave_if(ISU_ALU_datain),
	`msg_master_if(ALU_WBU_res),

	`msg_slave_if(WBU_ALU_flush),
	`msg_master_if(ALU_ISU_forward)
);
	// pipeline
	`pipeline_msg_reg(ISU_ALU_datain);
	`pipeline_msg_reg(WBU_ALU_flush);


	// flush
	`msglen_wire(WBU_ALU_flush, kind, flush_kind);
	`msglen_wire(WBU_ALU_flush, branch_id, flush_branch_id);
	`msglen_wire(ISU_ALU_datain, is_delayslot, is_delayslot);
	`msglen_wire(ISU_ALU_datain, branch_id, branch_id);

	`pipeline_msg_get(WBU_ALU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_ALU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(ISU_ALU_datain, is_delayslot, is_delayslot);
	`pipeline_msg_get(ISU_ALU_datain, branch_id, branch_id);

    wire flushed;
    reg flush_cond_true;
	`flush_judge(flush_cond_true, flush_kind, is_delayslot, branch_id, flush_branch_id);

	always@(posedge clk) begin
		if(!flushed | S_ISU_ALU_datain_tready) begin
			`pipeline_msg_get_reg(WBU_ALU_flush)
		end
	end

	// control
	// value: 
	//        nop :     P_valid = 1'b0   (rst| ....)
	//        flushed : inst be flushed
	//        passed :  send value to next unit

	wire nop;
	reg passed;
	assign flushed = flush_cond_true & P_WBU_ALU_flush_valid;
	assign nop = !P_ISU_ALU_datain_valid;

	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(ISU_ALU_datain)
		`pipeline_msg_else
			if(S_ISU_ALU_datain_tready) begin
				`pipeline_msg_get_reg(ISU_ALU_datain)
				passed <= 1'b0;
			end
			else if(M_ALU_WBU_res_tvalid & M_ALU_WBU_res_tready) begin
				passed <= 1'b1;
			end
		`pipeline_msg_get_end
	end

	assign S_ISU_ALU_datain_tready = M_ALU_WBU_res_tvalid & M_ALU_WBU_res_tready | nop | passed | flushed;
	assign M_ALU_WBU_res_tvalid    = P_ISU_ALU_datain_valid & !flushed;
	`msglen_wire(ISU_ALU_datain, A, A);
	`msglen_wire(ISU_ALU_datain, B, B);
	`msglen_wire(ISU_ALU_datain, fu_op, op);
	`msglen_wire(ISU_ALU_datain, rd, rd);
	`msglen_wire(ISU_ALU_datain, sel, sel);
	`msglen_wire(ISU_ALU_datain, PC, PC);
	`msglen_wire(ISU_ALU_datain, ETW, old_etw);
	`msglen_wire(ISU_ALU_datain, ETW, new_etw);


	`pipeline_msg_get(ISU_ALU_datain, A, A);
	`pipeline_msg_get(ISU_ALU_datain, B, B);
	`pipeline_msg_get(ISU_ALU_datain, fu_op, op);
	`pipeline_msg_get(ISU_ALU_datain, rd, rd);
	`pipeline_msg_get(ISU_ALU_datain, sel, sel);
	`pipeline_msg_get(ISU_ALU_datain, PC, PC);
	`pipeline_msg_get(ISU_ALU_datain, ETW, old_etw);

	`DATA_VAR_REG(res);
	`DATA_VAR_REG(overflow);
	always@(*) begin
		case(op)
			`FU_OP_ALU_ADD: res = A + B;
			`FU_OP_ALU_SUB: res = A - B;
			`FU_OP_ALU_LUI: res = {B[15:0], 16'b0};
			`FU_OP_ALU_XOR: res = A ^ B;
			`FU_OP_ALU_SLTU: res = (A < B) ? `CONST_DATA_D(1) : `CONST_DATA_D(0);
			`FU_OP_ALU_SLT: res = ($signed(A) < $signed(B)) ? `CONST_DATA_D(1) : `CONST_DATA_D(0);
			`FU_OP_ALU_OR:  res = A | B;
			`FU_OP_ALU_SLL:  res = B << A[4:0];
			`FU_OP_ALU_SRL:  res = B >> A[4:0]; 
			`FU_OP_ALU_SRA:  res = $signed(B) >>> A[4:0]; 
			`FU_OP_ALU_MOVN: res = A;
			`FU_OP_ALU_MOVZ: res = A;
			`FU_OP_ALU_AND: res = A & B;
			`FU_OP_ALU_NOR:  res = ~(A | B);
			`FU_OP_ALU_MFC0: res = A;
			`FU_OP_ALU_MTC0: res = B;
			`FU_OP_ALU_ADD_OV: res = A + B;
			`FU_OP_ALU_SUB_OV: res = A - B;
			default: res = `CONST_DATA_D(0);
		endcase
	end

	always@(*) begin
		case(op)
			`FU_OP_ALU_ADD_OV: overflow = (!A[31] & !B[31] & res[31]) | (A[31] & B[31] & !res[31]);
			`FU_OP_ALU_SUB_OV: overflow = (!A[31] & B[31] & res[31]) | (A[31] & !B[31] & !res[31]);
			default: overflow = 1'b0;
		endcase
	end

	`msg_put(ALU_WBU_res, val, res);
	`msg_put(ALU_WBU_res, rd, rd);
	`msg_put(ALU_WBU_res, sel, sel);


	`msglen_reg(ALU_WBU_res, rd_wen, rd_wen);
	always@(*) begin
		case(op)
			`FU_OP_ALU_MOVN: rd_wen = (B != `CONST_DATA_D(0));
			`FU_OP_ALU_MOVZ: rd_wen = (B == `CONST_DATA_D(0));
			default: rd_wen = 1'b1;
		endcase
	end

	`msg_put(ALU_ISU_forward, val, res);
	`msg_put(ALU_ISU_forward, rd_byte_wen, {4{rd_wen}});
	assign M_ALU_ISU_forward_tvalid  = P_ISU_ALU_datain_valid;
	
	`msg_put(ALU_WBU_res, rd_wen, rd_wen);

    `ET_Append1(new_etw, old_etw, `ET_OV, overflow);

	`msg_put(ALU_WBU_res, PC, PC);
	`msg_put(ALU_WBU_res, is_delayslot, is_delayslot);
	`msg_put(ALU_WBU_res, branch_id, branch_id);
	`msg_put(ALU_WBU_res, ETW, new_etw);


endmodule
