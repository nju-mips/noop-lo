`include "common.vh"
`include "exception.vh"
`include "flush.vh"

module ifu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
	`msg_master_if(IFU_IDU_instr),
	`msg_slave_if(WBU_IFU_branch),

	`msg_slave_if(WBU_IFU_flush),
	`msg_master_if(IFU_IFPCU_request),
	`msg_slave_if(IFPCU_IFU_response)
);
	// pipeline
	`pipeline_msg_reg(WBU_IFU_branch);
	`pipeline_msg_reg(WBU_IFU_flush);


	// flush
	wire is_delayslot;
	wire[`BRANCH_ID_BIT-1:0] branch_id;

	`msglen_wire(WBU_IFU_flush, kind, flush_kind);
	`msglen_wire(WBU_IFU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(WBU_IFU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_IFU_flush, branch_id, flush_branch_id);


	reg flush_cond_true;
    wire flushed;
	`flush_judge(flush_cond_true, flush_kind, is_delayslot, branch_id, flush_branch_id);

	always@(posedge clk) begin
		if(!flushed | S_IFPCU_IFU_response_tvalid) begin
			`pipeline_msg_get_reg(WBU_IFU_flush)
		end
	end
	// wire flush = S_WBU_IFU_flush_tvalid;
	assign flushed = flush_cond_true & P_WBU_IFU_flush_valid;


	wire has_jmp, branch_ready;
	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(WBU_IFU_branch)
		`pipeline_msg_else
			if(S_WBU_IFU_branch_tvalid) begin
				`pipeline_msg_get_reg(WBU_IFU_branch)
			end
			else if (S_IFPCU_IFU_response_tvalid & M_IFU_IDU_instr_tready & branch_ready) begin
				`pipeline_msg_get_flush(WBU_IFU_branch)
			end
		`pipeline_msg_get_end
	end
	assign S_WBU_IFU_branch_tready = 1'b1;
	assign M_IFU_IDU_instr_tvalid  = S_IFPCU_IFU_response_tvalid & !flushed;

	`msglen_wire(WBU_IFU_branch, PC_branch, br_target);
	`msglen_wire(WBU_IFU_branch, has_exception, has_exception);
	`msglen_wire(WBU_IFU_branch, is_taken, is_taken);	

	`pipeline_msg_get(WBU_IFU_branch, PC_branch, br_target);
	`pipeline_msg_get(WBU_IFU_branch, has_exception, has_exception);
	`pipeline_msg_get(WBU_IFU_branch, is_taken, is_taken);	


	assign has_jmp = (is_taken | has_exception);
	`DATA_VAR_REG(PC);
	`DATA_VAR_WIRE(next_pc); 
	always @(posedge clk) begin
		if(rst) begin 
			PC <= `ENTRY;
		end
		else if(S_IFPCU_IFU_response_tvalid & M_IFU_IDU_instr_tready)begin
			PC <= next_pc;
		end
	end

	wire [31:0] phaddr;
	fmt if_fmt(
		.vaddr(PC),
		.phaddr(phaddr)
	);
	
	`msglen_wire(IFPCU_IFU_response, instr, instr);
    `msg_get(IFPCU_IFU_response, instr, instr);
  
	next_pc next_pc0(
	  .clk(clk),
	  .rst(rst),
	  .instr(instr),
	  .pc(PC),
      .inst_valid(S_IFPCU_IFU_response_tvalid),
      .nextu_ready(M_IFU_IDU_instr_tready),

      .branch_valid(has_jmp),
      .has_exception(has_exception),
      .is_taken(is_taken),
      .br_target(br_target),
      .branch_ready(branch_ready),
            
      .next_pc(next_pc),
      .isdelayslot(is_delayslot),
      .branch_id(branch_id)
		);


	assign M_IFU_IFPCU_request_tvalid = M_IFU_IDU_instr_tready;



	`msg_put(IFU_IFPCU_request, PC, phaddr);

	`msg_put(IFU_IDU_instr, instr, instr);

	`msglen_wire(IFU_IDU_instr, ETW, ETW);
	assign ETW = `CONST_DATA_H(0);

	`msg_put(IFU_IDU_instr, PC, PC);
	`msg_put(IFU_IDU_instr, is_delayslot, is_delayslot);
	`msg_put(IFU_IDU_instr, branch_id, branch_id);
	`msg_put(IFU_IDU_instr, ETW, ETW);

	//assign m_axis_instr_tvalid = m_axi_instr_rvalid;	// should check rresp

endmodule
