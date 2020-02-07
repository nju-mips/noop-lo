`include "decode.vh"
`include "common.vh"
`include "exception.vh"
`include "flush.vh"

module idu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
	`msg_slave_if(IFU_IDU_instr),
	`msg_master_if(IDU_ISU_decode),

	`msg_slave_if(WBU_IDU_flush)
);
	// pipeline
	`pipeline_msg_reg(IFU_IDU_instr);
	`pipeline_msg_reg(WBU_IDU_flush);

	// flush
	`msglen_wire(WBU_IDU_flush, kind, flush_kind);
	`msglen_wire(WBU_IDU_flush, branch_id, flush_branch_id);
	`msglen_wire(IFU_IDU_instr, is_delayslot, is_delayslot);
	`msglen_wire(IFU_IDU_instr, branch_id, branch_id);

	`pipeline_msg_get(WBU_IDU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_IDU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(IFU_IDU_instr, is_delayslot, is_delayslot);
	`pipeline_msg_get(IFU_IDU_instr, branch_id, branch_id);

    reg flush_cond_true;
    wire flushed;
	`flush_judge(flush_cond_true, flush_kind, is_delayslot, branch_id, flush_branch_id);

	always@(posedge clk) begin
		if(!flushed | S_IFU_IDU_instr_tready) begin
			`pipeline_msg_get_reg(WBU_IDU_flush)
		end
	end

	// control
	// value: 
	//        nop :     P_valid = 1'b0   (rst| ....)
	//        flushed : inst be flushed
	//        passed :  send value to next unit

    wire nop;
	reg passed;
	assign flushed = flush_cond_true & P_WBU_IDU_flush_valid;
	assign nop = !P_IFU_IDU_instr_valid;

	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(IFU_IDU_instr)
		`pipeline_msg_else
			if(S_IFU_IDU_instr_tready) begin
				`pipeline_msg_get_reg(IFU_IDU_instr)
				passed <= 1'b0;
			end
			else if(M_IDU_ISU_decode_tvalid & M_IDU_ISU_decode_tready) begin
				passed <= 1'b1;
			end
		`pipeline_msg_get_end
	end

	assign S_IFU_IDU_instr_tready  = M_IDU_ISU_decode_tvalid & M_IDU_ISU_decode_tready | nop | passed | flushed;
	assign M_IDU_ISU_decode_tvalid = P_IFU_IDU_instr_valid & !flushed;

	`msglen_wire(IFU_IDU_instr, instr, instr);
	`msglen_wire(IFU_IDU_instr, PC, PC);
	`msglen_wire(IFU_IDU_instr, ETW, old_etw);

	`pipeline_msg_get(IFU_IDU_instr, instr, instr);
	`pipeline_msg_get(IFU_IDU_instr, PC, PC);
	`pipeline_msg_get(IFU_IDU_instr, ETW, old_etw);


	wire [4:0] rs = instr[25:21];
	wire [4:0] rt = instr[20:16];
	wire [4:0] rd = a_src == `A_SRC_CP0_EPC ? `CPR_EPC : instr[15:11];
	wire [4:0] sa = instr[10:6];		// shift amount, used by shift word instructions
	wire [2:0] sel = instr[2:0];		// used by MFC0/MTC0
	wire [25:0] offset = instr[25:0];	// imm is contained in [15:0]

	// ROM address
	// common opcode -> 000 xxxxxx (opcode)
	// spceial  ->		001 xxxxxx (function)
	// spceial2 ->		010 xxxxxx (function)
	// regimm   ->		011 0xxxxx (rt)
	// cop0     ->		100 0xxxxx (rs)

	wire [5:0] opcode = instr[31:26];
	wire [5:0] func = instr[5:0];
	reg [8:0] lookup_idx;
	always @(*) begin
		if(opcode == `OPCODE_SPECIAL) begin
				lookup_idx = {`INSTR_TYPE_SPECIAL, func};
		end
		else if(opcode == `OPCODE_SPECIAL2) begin
				lookup_idx = {`INSTR_TYPE_SPECIAL2, func};
		end
		else if(opcode == `OPCODE_REGIMM) begin
			lookup_idx = {`INSTR_TYPE_REGIMM, 1'b0, rt};
		end
		else if(opcode == `OPCODE_COP0) begin
			lookup_idx = {`INSTR_TYPE_COP0, 1'b0, rs};
		end
		else begin
			lookup_idx = {`INSTR_TYPE_COMMON, opcode};
		end
	end

	`msglen_wire(IDU_ISU_decode, fu_type, fu_type);
	`msglen_wire(IDU_ISU_decode, fu_op, fu_op);
	`msglen_wire(IDU_ISU_decode, b_src, b_src);
	`msglen_wire(IDU_ISU_decode, ext_type, ext_type);
	`msglen_wire(IDU_ISU_decode, rd_sel, rd_sel);
	`msglen_wire(IDU_ISU_decode, a_src, a_src);
	`msglen_wire(IDU_ISU_decode, ETW, new_etw);
	wire[`DE_SPECIAL_LEN - 1 : 0] de_special;
	wire[25:0] mask;
	wire[25:0] value;

	DCROM decode_rom(
		.lookup_idx(lookup_idx),
		.fu_type(fu_type),
		.fu_op(fu_op),
		.b_src(b_src),
		.ext_type(ext_type),
		.rd_sel(rd_sel),
		.a_src(a_src),
		.de_special(de_special),
		.mask(mask),
		.value(value)
	);

	`msg_put(IDU_ISU_decode, PC, PC);
	`msg_put(IDU_ISU_decode, rs, rs);
	`msg_put(IDU_ISU_decode, rt, rt);
	`msg_put(IDU_ISU_decode, sa, sa);
	`msg_put(IDU_ISU_decode, offset, offset);
	`msg_put(IDU_ISU_decode, b_src, b_src);
	`msg_put(IDU_ISU_decode, ext_type, ext_type);
	`msg_put(IDU_ISU_decode, rd, rd);
	`msg_put(IDU_ISU_decode, rd_sel, rd_sel);
	`msg_put(IDU_ISU_decode, fu_type, fu_type);
	`msg_put(IDU_ISU_decode, fu_op, fu_op);
	`msg_put(IDU_ISU_decode, a_src, a_src);
	`msg_put(IDU_ISU_decode, sel, sel);
	`msg_put(IDU_ISU_decode, is_delayslot, is_delayslot);
	`msg_put(IDU_ISU_decode, branch_id, branch_id);

	`ET_Append4(new_etw,     old_etw,
	           `ET_SYSCALL,  de_special == `DE_SPECIAL_SYSCALL,
	           `ET_INVOP,    (instr[25:0] & mask) != value,
	           `ET_BP,       de_special == `DE_SPECIAL_BREAK,
	           `ET_eret,     de_special == `DE_SPECIAL_ERET
	           );
	
	`msg_put(IDU_ISU_decode, ETW, new_etw);

endmodule
