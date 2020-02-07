`include "common.vh"
`include "exception.vh"
`include "flush.vh"

module wbu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,

	`msg_slave_if(ALU_WBU_res),
	`msg_slave_if(MDU_WBU_res),
	`msg_slave_if(MDU_WBU_hilo),
	`msg_slave_if(LSU_WBU_res),
	`msg_slave_if(BRU_WBU_res),
	`msg_master_if(WBU_IFU_branch),
	`msg_master_if(WBU_ISU_hilo),
	`msg_master_if(WBU_ISU_wb),

	`msg_master_if(WBU_CP0_exception),
	`msg_slave_if(CP0_WBU_exception),


	`msg_slave_if(WBU_WBU_flush),
	`msg_master_if(WBU_IFU_flush),
	`msg_master_if(WBU_IDU_flush),
	`msg_master_if(WBU_ISU_flush),
	`msg_master_if(WBU_ALU_flush),
	`msg_master_if(WBU_BRU_flush),
	`msg_master_if(WBU_MDU_flush),
	`msg_master_if(WBU_LSU_flush),
	`msg_master_if(WBU_WBU_flush)
);
	// pipeline
	`pipeline_msg_reg(ALU_WBU_res);
	`pipeline_msg_reg(MDU_WBU_res);
	`pipeline_msg_reg(MDU_WBU_hilo);
	`pipeline_msg_reg(LSU_WBU_res);
	`pipeline_msg_reg(BRU_WBU_res);
	`pipeline_msg_reg(WBU_WBU_flush);

	// flush
	`msglen_wire(WBU_WBU_flush, kind, flush_kind);
	`msglen_wire(WBU_WBU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(WBU_WBU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_WBU_flush, branch_id, flush_branch_id);

	`msglen_wire(ALU_WBU_res, is_delayslot, alu_is_delayslot);
	`msglen_wire(BRU_WBU_res, is_delayslot, bru_is_delayslot);
	`msglen_wire(LSU_WBU_res, is_delayslot, lsu_is_delayslot);
	`msglen_wire(MDU_WBU_res, is_delayslot, mdu_is_delayslot);

	`pipeline_msg_get(ALU_WBU_res, is_delayslot, alu_is_delayslot);
	`pipeline_msg_get(BRU_WBU_res, is_delayslot, bru_is_delayslot);
	`pipeline_msg_get(LSU_WBU_res, is_delayslot, lsu_is_delayslot);
	`pipeline_msg_get(MDU_WBU_res, is_delayslot, mdu_is_delayslot);

	wire isdelayslot = (P_ALU_WBU_res_valid ? alu_is_delayslot :
		(P_LSU_WBU_res_valid ? lsu_is_delayslot :
		(P_MDU_WBU_res_valid ? mdu_is_delayslot :
		(P_BRU_WBU_res_valid ? bru_is_delayslot :
		1'b0
	))));


	`msglen_wire(ALU_WBU_res, branch_id, alu_branch_id);
	`msglen_wire(BRU_WBU_res, branch_id, bru_branch_id);
	`msglen_wire(LSU_WBU_res, branch_id, lsu_branch_id);
	`msglen_wire(MDU_WBU_res, branch_id, mdu_branch_id);

	`pipeline_msg_get(ALU_WBU_res, branch_id, alu_branch_id);
	`pipeline_msg_get(BRU_WBU_res, branch_id, bru_branch_id);
	`pipeline_msg_get(LSU_WBU_res, branch_id, lsu_branch_id);
	`pipeline_msg_get(MDU_WBU_res, branch_id, mdu_branch_id);

	wire[`BRANCH_ID_BIT-1:0] branch_id = (P_ALU_WBU_res_valid ? alu_branch_id :
		(P_LSU_WBU_res_valid ? lsu_branch_id :
		(P_MDU_WBU_res_valid ? mdu_branch_id :
		(P_BRU_WBU_res_valid ? bru_branch_id :
		{`BRANCH_ID_BIT{1'b0}}
	))));

	wire flushed;
    reg flush_cond_true;
	`flush_judge(flush_cond_true, flush_kind, isdelayslot, branch_id, flush_branch_id);

	always@(posedge clk) begin
		if(!flushed | 
			S_ALU_WBU_res_tready  | S_MDU_WBU_res_tready | 
		    S_MDU_WBU_hilo_tready | S_LSU_WBU_res_tready | 
		    S_BRU_WBU_res_tready ) begin
				`pipeline_msg_get_reg(WBU_WBU_flush)
			end
	end

	// control
	// value: 
	//        nop :     P_valid = 1'b0   (rst| ....)
	//        flushed : inst be flushed
	//        passed :  send value to next unit

    wire nop;
	reg passed;
	assign flushed = flush_cond_true & P_WBU_WBU_flush_valid;
	assign nop = !P_ALU_WBU_res_valid & !P_LSU_WBU_res_valid & !P_MDU_WBU_res_valid & !P_BRU_WBU_res_valid;


	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(ALU_WBU_res)
			`pipeline_msg_get_flush(MDU_WBU_res)
			`pipeline_msg_get_flush(MDU_WBU_hilo)
			`pipeline_msg_get_flush(LSU_WBU_res)
			`pipeline_msg_get_flush(BRU_WBU_res)
		`pipeline_msg_else
			if( S_ALU_WBU_res_tready  | S_MDU_WBU_res_tready | 
		    S_MDU_WBU_hilo_tready | S_LSU_WBU_res_tready | 
		    S_BRU_WBU_res_tready ) begin
				`pipeline_msg_get_reg(ALU_WBU_res)
				`pipeline_msg_get_reg(MDU_WBU_res)
				`pipeline_msg_get_reg(MDU_WBU_hilo)
				`pipeline_msg_get_reg(LSU_WBU_res)
				`pipeline_msg_get_reg(BRU_WBU_res)
				passed <= 1'b0;
			end
			else if (M_WBU_IFU_branch_tvalid & M_WBU_IFU_branch_tready) begin
				passed <= 1'b1;
			end
		`pipeline_msg_get_end
	end
	wire is_taken;

	`msglen_wire(CP0_WBU_exception, has_exception, has_exception);
	`msglen_wire(CP0_WBU_exception, eret, eret);
	`msglen_wire(CP0_WBU_exception, epc, epc);
	`msg_get(CP0_WBU_exception, has_exception, has_exception);
	`msg_get(CP0_WBU_exception, eret, eret);
	`msg_get(CP0_WBU_exception, epc, epc);

	assign S_ALU_WBU_res_tready  = M_WBU_IFU_branch_tready | nop | passed | flushed;
	assign S_MDU_WBU_res_tready  = M_WBU_IFU_branch_tready | nop | passed | flushed;
	assign S_MDU_WBU_hilo_tready = M_WBU_IFU_branch_tready | nop | passed | flushed;
	assign S_LSU_WBU_res_tready  = M_WBU_IFU_branch_tready | nop | passed | flushed;
	assign S_BRU_WBU_res_tready  = M_WBU_IFU_branch_tready | nop | passed | flushed;


    wire branch_taken = (P_BRU_WBU_res_valid & is_taken | eret | has_exception) & !flushed;                                 

	assign M_WBU_IFU_branch_tvalid = branch_taken;

    // flush
    assign M_WBU_IFU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;
    assign M_WBU_IDU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;
    assign M_WBU_ISU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;
    assign M_WBU_ALU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;
    assign M_WBU_BRU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;
    assign M_WBU_LSU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;
    assign M_WBU_MDU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;
    assign M_WBU_WBU_flush_tvalid = branch_taken ? 1'b1 : 1'b0;

    wire[`FLUSH_KIND_BIT-1:0] send_flush_kind;
    wire[`BRANCH_ID_BIT-1:0] send_branch_id;
    assign send_flush_kind = eret | has_exception ? `flush_no_cond : 
    			(P_BRU_WBU_res_valid & is_taken ? `flush_cond : `no_flush);

	`pipeline_msg_get(BRU_WBU_res, branch_id, send_branch_id);

    `msg_put(WBU_IFU_flush, kind, send_flush_kind);
    `msg_put(WBU_IFU_flush, branch_id, send_branch_id);
    `msg_put(WBU_IDU_flush, kind, send_flush_kind);
    `msg_put(WBU_IDU_flush, branch_id, send_branch_id);
    `msg_put(WBU_ISU_flush, kind, send_flush_kind);
    `msg_put(WBU_ISU_flush, branch_id, send_branch_id);
    `msg_put(WBU_ALU_flush, kind, send_flush_kind);
    `msg_put(WBU_ALU_flush, branch_id, send_branch_id);
    `msg_put(WBU_BRU_flush, kind, send_flush_kind);
    `msg_put(WBU_BRU_flush, branch_id, send_branch_id);
    `msg_put(WBU_LSU_flush, kind, send_flush_kind);
    `msg_put(WBU_LSU_flush, branch_id, send_branch_id);
    `msg_put(WBU_MDU_flush, kind, send_flush_kind);
    `msg_put(WBU_MDU_flush, branch_id, send_branch_id);
    `msg_put(WBU_WBU_flush, kind, send_flush_kind);
    `msg_put(WBU_WBU_flush, branch_id, send_branch_id);

    // execute
	`msglen_wire(ALU_WBU_res, val, real_val);
	`msglen_wire(ALU_WBU_res, val, alu_val);
	`msglen_wire(LSU_WBU_res, val, lsu_val);
	`msglen_wire(MDU_WBU_res, val, mdu_val);
	`msglen_wire(BRU_WBU_res, val, bru_val);

	`pipeline_msg_get(ALU_WBU_res, val, alu_val);
	`pipeline_msg_get(LSU_WBU_res, val, lsu_val);
	`pipeline_msg_get(MDU_WBU_res, val, mdu_val);
	`pipeline_msg_get(BRU_WBU_res, val, bru_val);

	assign real_val = (P_ALU_WBU_res_valid ? alu_val :
		(P_LSU_WBU_res_valid ? lsu_val :
		(P_MDU_WBU_res_valid ? mdu_val :
		(P_BRU_WBU_res_valid ? bru_val :
		{ALU_WBU_res_val_len{1'b0}}
	))));

	`msg_put(WBU_ISU_wb, val, real_val);


	`msglen_wire(ALU_WBU_res, rd, real_rd);
	`msglen_wire(ALU_WBU_res, rd, alu_rd);
	`msglen_wire(LSU_WBU_res, rd, lsu_rd);
	`msglen_wire(MDU_WBU_res, rd, mdu_rd);
	`msglen_wire(BRU_WBU_res, rd, bru_rd);

	`pipeline_msg_get(ALU_WBU_res, rd, alu_rd);
	`pipeline_msg_get(LSU_WBU_res, rd, lsu_rd);
	`pipeline_msg_get(MDU_WBU_res, rd, mdu_rd);
	`pipeline_msg_get(BRU_WBU_res, rd, bru_rd);

	assign real_rd = (P_ALU_WBU_res_valid ? alu_rd :
		(P_LSU_WBU_res_valid ? lsu_rd :
		(P_MDU_WBU_res_valid ? mdu_rd :
		(P_BRU_WBU_res_valid ? bru_rd :
		{ALU_WBU_res_rd_len{1'b0}}
	))));

	`msg_put(WBU_ISU_wb, rd, real_rd);


	`msglen_wire(ALU_WBU_res, rd_wen, alu_rd_wen);
	`msglen_wire(BRU_WBU_res, rd_wen, bru_rd_wen);
	`msglen_wire(MDU_WBU_res, rd_wen, mdu_rd_wen);
	`msglen_wire(LSU_WBU_res, rd_byte_wen, lsu_rd_byte_wen);

	`pipeline_msg_get(ALU_WBU_res, rd_wen, alu_rd_wen);
	`pipeline_msg_get(BRU_WBU_res, rd_wen, bru_rd_wen);
	`pipeline_msg_get(MDU_WBU_res, rd_wen, mdu_rd_wen);
	`pipeline_msg_get(LSU_WBU_res, rd_byte_wen, lsu_rd_byte_wen);

	`msglen_wire(WBU_ISU_wb, rd_byte_wen, rd_byte_wen);
	assign rd_byte_wen = (P_ALU_WBU_res_valid ? {WBU_ISU_wb_rd_byte_wen_len{alu_rd_wen}} :
		(P_BRU_WBU_res_valid ? {WBU_ISU_wb_rd_byte_wen_len{bru_rd_wen}} :
		(P_MDU_WBU_res_valid ? {WBU_ISU_wb_rd_byte_wen_len{mdu_rd_wen}} :
		(P_LSU_WBU_res_valid ? lsu_rd_byte_wen :
		{WBU_ISU_wb_rd_byte_wen_len{1'b0}}
	))));

	`msg_put(WBU_ISU_wb, rd_byte_wen, rd_byte_wen);


	`msglen_wire(ALU_WBU_res, sel, alu_sel);
	
	`pipeline_msg_get(ALU_WBU_res, sel, alu_sel);

	`msglen_wire(WBU_ISU_wb, sel, real_sel);
	assign real_sel = (P_ALU_WBU_res_valid ? alu_sel : 0);

	`msg_put(WBU_ISU_wb, sel, real_sel);

	assign M_WBU_ISU_wb_tvalid = (P_ALU_WBU_res_valid | P_LSU_WBU_res_valid | 
		P_MDU_WBU_res_valid | P_BRU_WBU_res_valid) & (!has_exception) & !flushed;

	// WBU -> ISU hilo
	`msglen_wire(MDU_WBU_hilo, hi, hi);
	`msglen_wire(MDU_WBU_hilo, lo, lo);
	`msglen_wire(MDU_WBU_hilo, hi_wen, hi_wen);
	`msglen_wire(MDU_WBU_hilo, lo_wen, lo_wen);

	`pipeline_msg_get(MDU_WBU_hilo, hi, hi);
	`pipeline_msg_get(MDU_WBU_hilo, lo, lo);
	`pipeline_msg_get(MDU_WBU_hilo, hi_wen, hi_wen);
	`pipeline_msg_get(MDU_WBU_hilo, lo_wen, lo_wen);

	`msg_put(WBU_ISU_hilo, hi, hi);
	`msg_put(WBU_ISU_hilo, lo, lo);
	`msg_put(WBU_ISU_hilo, hi_wen, hi_wen);
	`msg_put(WBU_ISU_hilo, lo_wen, lo_wen);


	assign M_WBU_ISU_hilo_tvalid = P_MDU_WBU_hilo_valid & (!has_exception) & !flushed;

	// WBU -> IFU branch
	`msglen_wire(WBU_IFU_branch, PC_branch, PC_branch);

	`pipeline_msg_get(BRU_WBU_res, target, PC_branch);
	`pipeline_msg_get(BRU_WBU_res, is_taken, is_taken);

	`msg_put(WBU_IFU_branch, PC_branch, PC_branch);
	`msg_put(WBU_IFU_branch, is_taken, (P_BRU_WBU_res_valid & is_taken | eret) & !has_exception & !flushed);
	`msg_put(WBU_IFU_branch, has_exception, has_exception);
	


	// exception
	`msglen_wire(ALU_WBU_res, PC, cur_pc);
	`msglen_wire(ALU_WBU_res, PC, alu_pc);
	`msglen_wire(LSU_WBU_res, PC, lsu_pc);
	`msglen_wire(MDU_WBU_res, PC, mdu_pc);
	`msglen_wire(BRU_WBU_res, PC, bru_pc);

	`pipeline_msg_get(ALU_WBU_res, PC, alu_pc);
	`pipeline_msg_get(LSU_WBU_res, PC, lsu_pc);
	`pipeline_msg_get(MDU_WBU_res, PC, mdu_pc);
	`pipeline_msg_get(BRU_WBU_res, PC, bru_pc);

	assign cur_pc = (P_ALU_WBU_res_valid ? alu_pc :
		(P_LSU_WBU_res_valid ? lsu_pc :
		(P_MDU_WBU_res_valid ? mdu_pc :
		(P_BRU_WBU_res_valid ? bru_pc :
		alu_pc
	))));


	//`msglen_wire(ALU_WBU_res, ETW, real_etw);
	`msglen_wire(ALU_WBU_res, ETW, alu_etw);
	`msglen_wire(LSU_WBU_res, ETW, lsu_etw);
	`msglen_wire(MDU_WBU_res, ETW, mdu_etw);
	`msglen_wire(BRU_WBU_res, ETW, bru_etw);

	`pipeline_msg_get(ALU_WBU_res, ETW, alu_etw);
	`pipeline_msg_get(LSU_WBU_res, ETW, lsu_etw);
	`pipeline_msg_get(MDU_WBU_res, ETW, mdu_etw);
	`pipeline_msg_get(BRU_WBU_res, ETW, bru_etw);

	`msglen_wire(LSU_WBU_res, ls_addr, ls_addr);
	`pipeline_msg_get(LSU_WBU_res, ls_addr, ls_addr);

	`msglen_wire(WBU_CP0_exception, etw, etw);
	`msglen_reg(WBU_CP0_exception, cur_inst_addr, cur_inst_addr);
	`msglen_reg(WBU_CP0_exception, badvaddr, badvaddr);
	`msglen_reg(WBU_CP0_exception, valid, inst_valid);
	`msglen_reg(WBU_CP0_exception, exception_handle, exception_handle);
	`msglen_reg(WBU_CP0_exception, int_enable, int_enable);

	assign etw = (flushed ? 32'b0 :
		(P_ALU_WBU_res_valid ? alu_etw :
		(P_LSU_WBU_res_valid ? lsu_etw :
		(P_MDU_WBU_res_valid ? mdu_etw :
		(P_BRU_WBU_res_valid ? bru_etw :
		alu_etw
	)))));

	// TO CP0
	always@(*) begin
		cur_inst_addr = cur_pc;
		if (P_LSU_WBU_res_valid) begin
		    badvaddr = ls_addr;
		end
		else if(P_BRU_WBU_res_valid) begin
		    badvaddr = PC_branch;
		end
		else begin
		    badvaddr = `CONST_DATA_H(0);
		end
		// is not nop and is valid
		inst_valid = (P_ALU_WBU_res_valid | P_LSU_WBU_res_valid | P_MDU_WBU_res_valid | P_BRU_WBU_res_valid) & !flushed;
		// jmp to EXCEPTION_ENTRY
		exception_handle = 1'b1;
		// handle it or not
		if (P_LSU_WBU_res_valid) begin
			int_enable = 1'b0;
		end
		else begin
			int_enable = 1'b1;
		end
	end

	`msg_put(WBU_CP0_exception, etw, etw);
	`msg_put(WBU_CP0_exception, cur_inst_addr, cur_inst_addr);
	`msg_put(WBU_CP0_exception, badvaddr, badvaddr);
	`msg_put(WBU_CP0_exception, isdelayslot, isdelayslot);
	`msg_put(WBU_CP0_exception, valid, inst_valid);
	`msg_put(WBU_CP0_exception, exception_handle, exception_handle);
	`msg_put(WBU_CP0_exception, int_enable, int_enable);
	assign M_WBU_CP0_exception_tvalid = !flushed;

endmodule
