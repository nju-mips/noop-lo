`include "decode.vh"
`include "common.vh"
`include "exception.vh"
`include "scoreboard.vh"
`include "axis.vh"
`include "msg_if.vh"
`include "flush.vh"

module isu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,

	`msg_slave_if(IDU_ISU_decode),
	`msg_master_if(ISU_ALU_datain),
	`msg_master_if(ISU_LSU_datain),
	`msg_master_if(ISU_MDU_datain),
	`msg_master_if(ISU_BRU_datain),
	`msg_slave_if(WBU_ISU_hilo),
	`msg_slave_if(WBU_ISU_wb),

	//cp0
	`msg_master_if(ISU_CP0_rw),
	`msg_slave_if(CP0_ISU_rdata),

	`msg_slave_if(WBU_ISU_flush),

	//forward
	`msg_slave_if(ALU_ISU_forward),
	`msg_slave_if(BRU_ISU_forward),
	`msg_slave_if(LSU_ISU_forward),
	`msg_slave_if(MDU_ISU_forward)
);
	// pipeline
	`pipeline_msg_reg(IDU_ISU_decode);
	`pipeline_msg_reg(WBU_ISU_flush);

	// flush
	`msglen_wire(WBU_ISU_flush, kind, flush_kind);
	`msglen_wire(WBU_ISU_flush, branch_id, flush_branch_id);
	`msglen_wire(IDU_ISU_decode, is_delayslot, is_delayslot);
	`msglen_wire(IDU_ISU_decode, branch_id, branch_id);

	`pipeline_msg_get(WBU_ISU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_ISU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(IDU_ISU_decode, is_delayslot, is_delayslot);
	`pipeline_msg_get(IDU_ISU_decode, branch_id, branch_id);

	wire flushed;
    reg flush_cond_true;
	`flush_judge(flush_cond_true, flush_kind, is_delayslot, branch_id, flush_branch_id);


 	always@(posedge clk) begin
		if(!flushed | S_IDU_ISU_decode_tready) begin
			`pipeline_msg_get_reg(WBU_ISU_flush)
		end
	end

	// control
	// value: 
	//        nop :     P_valid = 1'b0   (rst| ....)
	//        flushed : inst be flushed
	//        passed :  send value to next unit

    wire nop;
	reg passed;
	assign flushed = flush_cond_true & P_WBU_ISU_flush_valid;
	assign nop = !P_IDU_ISU_decode_valid;

	wire sb_run;


	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(IDU_ISU_decode)
		`pipeline_msg_else
			if(S_IDU_ISU_decode_tready) begin
				`pipeline_msg_get_reg(IDU_ISU_decode)
				passed <= 1'b0;
			end
			else if ( ((M_ISU_ALU_datain_tvalid & M_ISU_ALU_datain_tready) |
                       (M_ISU_LSU_datain_tvalid & M_ISU_LSU_datain_tready) |
                       (M_ISU_MDU_datain_tvalid & M_ISU_MDU_datain_tready) |
                       (M_ISU_BRU_datain_tvalid & M_ISU_BRU_datain_tready)) & sb_run ) begin
				passed <= 1'b1;
			end
		`pipeline_msg_get_end
	end

	assign S_IDU_ISU_decode_tready =  (M_ISU_ALU_datain_tvalid & M_ISU_ALU_datain_tready) |
                                      (M_ISU_LSU_datain_tvalid & M_ISU_LSU_datain_tready) |
                                      (M_ISU_MDU_datain_tvalid & M_ISU_MDU_datain_tready) |
                                      (M_ISU_BRU_datain_tvalid & M_ISU_BRU_datain_tready) |
                                      nop | passed | flushed;


	`msglen_wire(IDU_ISU_decode, PC, PC);
	`msglen_wire(IDU_ISU_decode, rs, rs);
	`msglen_wire(IDU_ISU_decode, rt, rt);
	`msglen_wire(IDU_ISU_decode, sa, sa);
	`msglen_wire(IDU_ISU_decode, offset, offset);
	`msglen_wire(IDU_ISU_decode, b_src, b_src);
	`msglen_wire(IDU_ISU_decode, ext_type, ext_type);
	`msglen_wire(IDU_ISU_decode, rd, rd);
	`msglen_wire(IDU_ISU_decode, rd_sel, rd_sel);
	`msglen_wire(IDU_ISU_decode, fu_type, fu_type);
	`msglen_wire(IDU_ISU_decode, fu_op, fu_op);
	`msglen_wire(IDU_ISU_decode, a_src, a_src);
	`msglen_wire(IDU_ISU_decode, ETW, old_etw);
	`msglen_wire(ISU_ALU_datain, sel, sel);
	`msglen_wire(IDU_ISU_decode, ETW, new_etw);

	`pipeline_msg_get(IDU_ISU_decode, PC, PC);
	`pipeline_msg_get(IDU_ISU_decode, rs, rs);
	`pipeline_msg_get(IDU_ISU_decode, rt, rt);
	`pipeline_msg_get(IDU_ISU_decode, sa, sa);
	`pipeline_msg_get(IDU_ISU_decode, offset, offset);
	`pipeline_msg_get(IDU_ISU_decode, b_src, b_src);
	`pipeline_msg_get(IDU_ISU_decode, ext_type, ext_type);
	`pipeline_msg_get(IDU_ISU_decode, rd, rd);
	`pipeline_msg_get(IDU_ISU_decode, rd_sel, rd_sel);
	`pipeline_msg_get(IDU_ISU_decode, fu_type, fu_type);
	`pipeline_msg_get(IDU_ISU_decode, fu_op, fu_op);
	`pipeline_msg_get(IDU_ISU_decode, a_src, a_src);
	`pipeline_msg_get(IDU_ISU_decode, sel, sel[2:0]);
	`pipeline_msg_get(IDU_ISU_decode, ETW, old_etw);

	// GPR
	`DATA_VAR_WIRE(rs_data);
	`DATA_VAR_WIRE(rt_data);

	`msglen_wire(WBU_ISU_wb, rd, rd_wb);
	`msglen_wire(WBU_ISU_wb, sel, sel_wb);
	`msglen_wire(WBU_ISU_wb, val, rd_data_wb);
	`msglen_wire(WBU_ISU_wb, rd_byte_wen, rd_byte_wen);

	`msg_get(WBU_ISU_wb, rd, rd_wb);
	`msg_get(WBU_ISU_wb, sel, sel_wb);
	`msg_get(WBU_ISU_wb, val, rd_data_wb);
	`msg_get(WBU_ISU_wb, rd_byte_wen, rd_byte_wen);

	`msglen_wire(WBU_ISU_wb, rd_byte_wen, reg_byte_wen);
	assign reg_byte_wen = ((S_WBU_ISU_wb_tvalid && (!sel_wb[3])) ? rd_byte_wen : 0);

	reg_file rf_i(
		.clk(clk),
		.rst(rst),
		.raddr1(rs),
		.rdata1(rs_data),
		.raddr2(rt),
		.rdata2(rt_data),
		.waddr(rd_wb),
		.byte_wen(reg_byte_wen),
		.wdata(rd_data_wb)
	);

	// HI, LO registers
	`DATA_VAR_REG(hi);
	`DATA_VAR_REG(lo);

	`msglen_wire(WBU_ISU_hilo, hi, hi_data);
	`msglen_wire(WBU_ISU_hilo, lo, lo_data);
	`msglen_wire(WBU_ISU_hilo, hi_wen, hi_wen);
	`msglen_wire(WBU_ISU_hilo, lo_wen, lo_wen);

	`msg_get(WBU_ISU_hilo, hi, hi_data);
	`msg_get(WBU_ISU_hilo, lo, lo_data);
	`msg_get(WBU_ISU_hilo, hi_wen, hi_wen);
	`msg_get(WBU_ISU_hilo, lo_wen, lo_wen);


	always@(posedge clk) begin
		if(S_WBU_ISU_hilo_tvalid) begin
			if(hi_wen)
				hi <= hi_data;
			if(lo_wen)
				lo <= lo_data;
		end
	end

	// CP0 registers
	// write	
	`msg_put(ISU_CP0_rw, wen, S_WBU_ISU_wb_tvalid & sel_wb[3]);
	`msg_put(ISU_CP0_rw, wsel, sel_wb[2:0]);
	`msg_put(ISU_CP0_rw, wrd, rd_wb);
	`msg_put(ISU_CP0_rw, wval, rd_data_wb);
	//read
	`msglen_wire(CP0_ISU_rdata, val, cp0_rdata);
	`msg_put(ISU_CP0_rw, rsel, sel[2:0]);
	`msg_put(ISU_CP0_rw, rrd, rd);
	`msg_get(CP0_ISU_rdata, val, cp0_rdata);

	assign M_ISU_CP0_rw_tvalid = S_WBU_ISU_wb_tvalid & sel_wb[3];



	// assign cp0_resl  = sel[2:0];
	// assign cp0_raddr = rd;

	assign sel[3] = M_ISU_ALU_datain_tvalid && (fu_op == `FU_OP_ALU_MTC0);

	wire [15:0] imm = offset[15:0];
	wire ext_bit = (ext_type == `EXT_TYPE_SIGN ? imm[15] : 1'b0);
	wire [31:0] ext_imm = {{16{ext_bit}}, imm};

	`msglen_reg(ISU_ALU_datain, A, A);
	`msglen_wire(ISU_ALU_datain, A, real_A);
	`msglen_reg(ISU_ALU_datain, B, B);
	`msglen_wire(ISU_ALU_datain, B, real_B);
	`msglen_reg(ISU_ALU_datain, rd, final_rd);

	reg[`REGBIT-1:0] sb_src1, sb_src2, sb_dst;


	always@(*) begin
		case(a_src)
			`A_SRC_RS: begin	
				A = rs_data;
				sb_src1 = `GPRRegs(rs);
			end
			`A_SRC_SA: begin
				A = {27'b0, sa};
				sb_src1 = `GPRRegs(0);
			end
			`A_SRC_HI: begin
				A = S_WBU_ISU_hilo_tvalid & hi_wen ? hi_data : hi;
				sb_src1 = `HIRegs;
			end
			`A_SRC_LO: begin
				A = S_WBU_ISU_hilo_tvalid & lo_wen ? lo_data : lo;
				sb_src1 = `LORegs;
			end
			`A_SRC_CP0: begin
				A = cp0_rdata;
				sb_src1 = `CP0Regs(rd);
			end
			`A_SRC_CP0_EPC: begin
				A = cp0_rdata;
				sb_src1 = `CP0Regs(rd);
			end
			default: begin
				A = `CONST_DATA_D(0);
				sb_src1 = `GPRRegs(0);
			end
		endcase

		case(b_src)
			`B_SRC_REG: begin
				B = rt_data;
				sb_src2 = `GPRRegs(rt);
			end
			`B_SRC_IMM: begin
				B = ext_imm;
				sb_src2 = `GPRRegs(0);
			end
			default: begin
				B = `CONST_DATA_D(0);
				sb_src2 = `GPRRegs(0);
			end
		endcase

		case(rd_sel)
			`RD_SEL_RD: begin
				final_rd = rd;
			end
			`RD_SEL_RT: begin
				final_rd = rt;
			end
			`RD_SEL_31: begin
				final_rd = `CONST_ADDR_D(31);
			end
			default: begin
				final_rd = `CONST_ADDR_D(0);
			end
		endcase
		if( rd_sel == `RD_SEL_HILO ||
		    rd_sel == `RD_SEL_HI   ||
		    rd_sel == `RD_SEL_LO ) begin
			case(rd_sel)
				`RD_SEL_HI: sb_dst = `HIRegs;
				`RD_SEL_LO: sb_dst = `LORegs;
				`RD_SEL_HILO: sb_dst = `HILORegs;
			endcase
		end
		else if(sel[3]) begin
			sb_dst = `CP0Regs(final_rd);
		end
		else begin
			sb_dst = `GPRRegs(final_rd);
		end
	end

	assign new_etw = old_etw;

	//Scoreboard

	`msglen_wire(ALU_ISU_forward, val, alu_forward);
	`msglen_wire(ALU_ISU_forward, rd_byte_wen, alu_forward_byte_wen);
	`msglen_wire(BRU_ISU_forward, val, bru_forward);
	`msglen_wire(BRU_ISU_forward, rd_byte_wen, bru_forward_byte_wen);
	`msglen_wire(LSU_ISU_forward, val, lsu_forward);
	`msglen_wire(LSU_ISU_forward, rd_byte_wen, lsu_forward_byte_wen);
	`msglen_wire(MDU_ISU_forward, val, mdu_forward);
	`msglen_wire(MDU_ISU_forward, rd_byte_wen, mdu_forward_byte_wen);

	`msg_get(ALU_ISU_forward, val, alu_forward);
	`msg_get(ALU_ISU_forward, rd_byte_wen, alu_forward_byte_wen);
	`msg_get(BRU_ISU_forward, val, bru_forward);
	`msg_get(BRU_ISU_forward, rd_byte_wen, bru_forward_byte_wen);
	`msg_get(LSU_ISU_forward, val, lsu_forward);
	`msg_get(LSU_ISU_forward, rd_byte_wen, lsu_forward_byte_wen);
	`msg_get(MDU_ISU_forward, val, mdu_forward);
	`msg_get(MDU_ISU_forward, rd_byte_wen, mdu_forward_byte_wen);

	sb sb0(
			.clk(clk),
			.rst(rst),
			.valid(P_IDU_ISU_decode_valid),
			.flush(flushed),
			
			.src1_value(A),
			.src2_value(B),

			.dst(sb_dst),
			.src1(sb_src1),
			.src2(sb_src2),

			.issue2alu((fu_type == `FU_TYPE_ALU || fu_type == `FU_TYPE_X) & P_IDU_ISU_decode_valid),
			.issue2bru((fu_type == `FU_TYPE_BRU) & P_IDU_ISU_decode_valid),
			.issue2lsu((fu_type == `FU_TYPE_LSU) & P_IDU_ISU_decode_valid),
			.issue2mdu((fu_type == `FU_TYPE_MDU) & P_IDU_ISU_decode_valid),

			.alu_res(alu_forward),
			.alu_res_byte_wen(alu_forward_byte_wen),
			.bru_res(bru_forward),
			.bru_res_byte_wen(bru_forward_byte_wen),
			.lsu_res(lsu_forward),
			.lsu_res_byte_wen(lsu_forward_byte_wen),
			.mdu_res(mdu_forward),
			.mdu_res_byte_wen(mdu_forward_byte_wen),

			.alu_ready(M_ISU_ALU_datain_tready),
	 		.bru_ready(M_ISU_BRU_datain_tready),
	 		.lsu_ready(M_ISU_LSU_datain_tready),
	 		.mdu_ready(M_ISU_MDU_datain_tready),
	 		.real_src1_value(real_A),
	 		.real_src2_value(real_B),
	 		.inst_run(sb_run)
		);


	`msg_put(ISU_ALU_datain, A, real_A);
	`msg_put(ISU_ALU_datain, B, real_B);
	`msg_put(ISU_ALU_datain, fu_op, fu_op);
	`msg_put(ISU_ALU_datain, rd, final_rd);
	`msg_put(ISU_ALU_datain, sel, sel);
	`msg_put(ISU_ALU_datain, PC, PC);
	`msg_put(ISU_ALU_datain, is_delayslot, is_delayslot);
	`msg_put(ISU_ALU_datain, branch_id, branch_id);
	`msg_put(ISU_ALU_datain, ETW, new_etw);

	`msg_put(ISU_LSU_datain, base, real_A);
	`msg_put(ISU_LSU_datain, offset, ext_imm);
	`msg_put(ISU_LSU_datain, wdata, real_B);
	`msg_put(ISU_LSU_datain, fu_op, fu_op);
	`msg_put(ISU_LSU_datain, rd, final_rd);
	`msg_put(ISU_LSU_datain, PC, PC);
	`msg_put(ISU_LSU_datain, is_delayslot, is_delayslot);
	`msg_put(ISU_LSU_datain, branch_id, branch_id);
	`msg_put(ISU_LSU_datain, ETW, new_etw);

	`msg_put(ISU_MDU_datain, A, real_A);
	`msg_put(ISU_MDU_datain, B, real_B);
	`msg_put(ISU_MDU_datain, fu_op, fu_op);
	`msg_put(ISU_MDU_datain, rd, final_rd);
	`msg_put(ISU_MDU_datain, PC, PC);
	`msg_put(ISU_MDU_datain, is_delayslot, is_delayslot);
	`msg_put(ISU_MDU_datain, branch_id, branch_id);
	`msg_put(ISU_MDU_datain, ETW, new_etw);

	`msg_put(ISU_BRU_datain, A, real_A);
	`msg_put(ISU_BRU_datain, B, real_B);
	`msg_put(ISU_BRU_datain, PC, PC);
	`msg_put(ISU_BRU_datain, offset, offset);
	`msg_put(ISU_BRU_datain, fu_op, fu_op);
	`msg_put(ISU_BRU_datain, rd, final_rd);
	`msg_put(ISU_BRU_datain, is_delayslot, is_delayslot);
	`msg_put(ISU_BRU_datain, branch_id, branch_id);
	`msg_put(ISU_BRU_datain, ETW, new_etw);

	assign M_ISU_ALU_datain_tvalid = (fu_type == `FU_TYPE_ALU || fu_type == `FU_TYPE_X) & P_IDU_ISU_decode_valid & sb_run & !flushed;
	assign M_ISU_LSU_datain_tvalid = (fu_type == `FU_TYPE_LSU) & P_IDU_ISU_decode_valid & sb_run & !flushed;
	assign M_ISU_MDU_datain_tvalid = (fu_type == `FU_TYPE_MDU) & P_IDU_ISU_decode_valid & sb_run & !flushed;
	assign M_ISU_BRU_datain_tvalid = (fu_type == `FU_TYPE_BRU) & P_IDU_ISU_decode_valid & sb_run & !flushed;

endmodule
