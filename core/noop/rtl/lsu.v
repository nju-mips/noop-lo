`include "decode.vh"
`include "common.vh"
`include "exception.vh"
`include "flush.vh"

module lsu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
`ifdef PERF_COUNTER
	output  load,
	output  store,
	output reg [63 : 0] load_cycles,
	output reg [63 : 0] store_cycles,
`endif
	`msg_slave_if(ISU_LSU_datain),
	`msg_master_if(LSU_WBU_res),
	`msg_master_if(LSU_ISU_forward),
	`msg_master_if(LSU_LSPCU_rdata),
	`msg_master_if(LSU_LSPCU_wdata),
	`msg_slave_if(LSPCU_LSU_rdata),
	`msg_slave_if(LSPCU_LSU_wdata),
	`msg_slave_if(WBU_LSU_flush)
 
);
	// pipeline
	`pipeline_msg_reg(ISU_LSU_datain);
	`pipeline_msg_reg(WBU_LSU_flush);


	// flush
	`msglen_wire(WBU_LSU_flush, kind, flush_kind);
	`msglen_wire(WBU_LSU_flush, branch_id, flush_branch_id);
	`msglen_wire(ISU_LSU_datain, is_delayslot, is_delayslot);
	`msglen_wire(ISU_LSU_datain, branch_id, branch_id);

	`pipeline_msg_get(WBU_LSU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_LSU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(ISU_LSU_datain, is_delayslot, is_delayslot);
	`pipeline_msg_get(ISU_LSU_datain, branch_id, branch_id);

	wire flushed;
    reg flush_cond_true;
	`flush_judge(flush_cond_true, flush_kind, is_delayslot, branch_id, flush_branch_id)

	always@(posedge clk) begin
		if(!flushed | S_ISU_LSU_datain_tready) begin
			`pipeline_msg_get_reg(WBU_LSU_flush)
		end
	end

	// control
	// value: 
	//        nop :     P_valid = 1'b0   (rst| ....)
	//        flushed : inst be flushed
	//        passed :  send value to next unit

  wire nop;
	reg passed;
	assign flushed = flush_cond_true & P_WBU_LSU_flush_valid;
	assign nop = !P_ISU_LSU_datain_valid;


	reg lsu_value_ready, start_run;
	wire is_finished = !start_run & lsu_value_ready;
	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(ISU_LSU_datain)
			start_run <= 1'b1;
		`pipeline_msg_else
			if(S_ISU_LSU_datain_tready) begin
				`pipeline_msg_get_reg(ISU_LSU_datain)
				start_run <= 1'b1;
				passed <= 1'b0;
			end
			else if (M_LSU_WBU_res_tvalid & M_LSU_WBU_res_tready) begin
				passed <= 1'b1;
				start_run <= 1'b0;
			end
			else begin
				start_run <= 1'b0;
			end
		`pipeline_msg_get_end
	end

	assign S_ISU_LSU_datain_tready = M_LSU_WBU_res_tvalid & M_LSU_WBU_res_tready | nop | passed | flushed;

	`msglen_wire(ISU_LSU_datain, base, base);
	`msglen_wire(ISU_LSU_datain, offset, offset);
	`msglen_wire(ISU_LSU_datain, wdata, wdata);
	`msglen_wire(ISU_LSU_datain, fu_op, fu_op);
	`msglen_wire(ISU_LSU_datain, rd, rd);
	`msglen_wire(ISU_LSU_datain, PC, PC);
	`msglen_wire(ISU_LSU_datain, ETW, old_etw);

	`pipeline_msg_get(ISU_LSU_datain, base, base);
	`pipeline_msg_get(ISU_LSU_datain, offset, offset);
	`pipeline_msg_get(ISU_LSU_datain, wdata, wdata);
	`pipeline_msg_get(ISU_LSU_datain, fu_op, fu_op);
	`pipeline_msg_get(ISU_LSU_datain, rd, rd);
	`pipeline_msg_get(ISU_LSU_datain, PC, PC);
	`pipeline_msg_get(ISU_LSU_datain, ETW, old_etw);

	`msglen_wire(ISU_LSU_datain, base, addr);
	assign addr = base + offset;


	wire [1:0] byte_sel = addr[1:0];
	wire [1:0] h_sel = addr[1:0];

	wire bad_addrl = ((addr[1:0] != 0) && (fu_op == `FU_OP_LSU_LW)) ||
		((addr[0] != 0) && ((fu_op == `FU_OP_LSU_LH) || (fu_op == `FU_OP_LSU_LHU)));

	wire bad_addrs = ((addr[1:0] != 0) && (fu_op == `FU_OP_LSU_SW)) ||
		((addr[0] != 0) && (fu_op == `FU_OP_LSU_SH));

	wire is_write = P_ISU_LSU_datain_valid & 
		((fu_op == `FU_OP_LSU_SW) ||
		 (fu_op == `FU_OP_LSU_SWL) ||
		 (fu_op == `FU_OP_LSU_SWR) ||
		 (fu_op == `FU_OP_LSU_SH) ||
		 (fu_op == `FU_OP_LSU_SB));

	wire is_read = P_ISU_LSU_datain_valid & 
		((fu_op == `FU_OP_LSU_LW) ||
		 (fu_op == `FU_OP_LSU_LWL) ||
		 (fu_op == `FU_OP_LSU_LWR) ||
		 (fu_op == `FU_OP_LSU_LBU) ||
		 (fu_op == `FU_OP_LSU_LH) ||
		 (fu_op == `FU_OP_LSU_LHU) ||
		 (fu_op == `FU_OP_LSU_LB));
		 
	`msglen_reg(ISU_LSU_datain, wdata, data_to_mem);
	always@(*) begin
		case(fu_op)
			`FU_OP_LSU_SW:	data_to_mem = wdata;
			`FU_OP_LSU_SB:	data_to_mem = (wdata << (8 * byte_sel));
			`FU_OP_LSU_SH:	data_to_mem = (wdata << (8 * h_sel));
			`FU_OP_LSU_SWL:	data_to_mem = (wdata >> (8 * (3 - byte_sel)));
			`FU_OP_LSU_SWR:	data_to_mem = (wdata << (8 * byte_sel));
			default:	data_to_mem = 32'b0;
		endcase
	end

	reg [3:0] mem_byte_wen;
	always@(*) begin
		case(fu_op)
			`FU_OP_LSU_SW:	mem_byte_wen = 4'b1111;
			`FU_OP_LSU_SB:	mem_byte_wen = (4'b0001 << byte_sel);
			`FU_OP_LSU_SH:	mem_byte_wen = (4'b0011 << h_sel);
			`FU_OP_LSU_SWL:	mem_byte_wen = (1 << (byte_sel + 5'b1)) - 1;
			`FU_OP_LSU_SWR:	mem_byte_wen = ~((1 << byte_sel) - 1);
			default:	mem_byte_wen = 4'b0000;
		endcase
	end

	`msglen_reg(LSPCU_LSU_rdata, rdata, rdata);
	
	always@(posedge clk) begin
		if(rst) begin
          rdata <= 0;
		end
		else if(S_LSPCU_LSU_rdata_tvalid) begin
          rdata <= S_LSPCU_LSU_rdata_tdata [ LSPCU_LSU_rdata_rdata_start +: LSPCU_LSU_rdata_rdata_len ];
		end
	end

	`msglen_reg(LSU_WBU_res, val, data_to_reg);
	always@(*) begin
		case(fu_op) //use reg fu_op to wait m_axi_data_rdata
			`FU_OP_LSU_LW:	data_to_reg = rdata;
			`FU_OP_LSU_LB:	data_to_reg = { { 24 {rdata[8 * byte_sel + 7]}}, rdata[8 * byte_sel +: 8] };
			`FU_OP_LSU_LBU:	data_to_reg = { 24'b0, rdata[8 * byte_sel +: 8] };
			`FU_OP_LSU_LH:	data_to_reg = { { 16 {rdata[8 * h_sel + 15]}}, rdata[8 * h_sel +: 16] };
			`FU_OP_LSU_LHU:	data_to_reg = { 16'b0, rdata[8 * h_sel +: 16] };
			`FU_OP_LSU_LWL:	data_to_reg = rdata << (24 - 8 * byte_sel);
			`FU_OP_LSU_LWR:	data_to_reg = rdata >> (8 * byte_sel);
			default:	data_to_reg = `CONST_DATA_D(0);
		endcase
	end

	`msglen_reg(LSU_WBU_res, rd_byte_wen, rd_byte_wen);
	always@(*) begin
		case(fu_op)
			`FU_OP_LSU_LW:	rd_byte_wen = 4'b1111;
			`FU_OP_LSU_LB:	rd_byte_wen = 4'b1111;
			`FU_OP_LSU_LBU:	rd_byte_wen = 4'b1111;
			`FU_OP_LSU_LH:	rd_byte_wen = 4'b1111;
			`FU_OP_LSU_LHU:	rd_byte_wen = 4'b1111;
			`FU_OP_LSU_LWL:	rd_byte_wen = 4'b1111 & ~((1 << (3 - byte_sel)) - 1);
			`FU_OP_LSU_LWR:	rd_byte_wen = 4'b1111 & ((1 << (4 - byte_sel)) - 1);
			default:	rd_byte_wen = 4'b0000;
		endcase
	end


	wire lsu_en = P_ISU_LSU_datain_valid & !is_finished & !bad_addrl & !bad_addrs & !nop & !rst & !flushed & !start_run;
	
	reg [2 : 0] state;
	parameter IDLE = 0, WAIT_READ_FINISH = 1, WAIT_WRITE_FINISH = 2; 
	always @(posedge clk) begin
		if(rst) begin
`ifdef PERF_COUNTER
			load_cycles <= 0;
			store_cycles <= 0;

`endif
			state <= IDLE;
			lsu_value_ready <= 1'b0;
		end
		else begin
			case(state)
				IDLE:
				begin
					lsu_value_ready <= 1'b0;
					if(lsu_en) begin
						if(is_read) begin
`ifdef PERF_COUNTER
							load_cycles <= load_cycles + 1;
`endif
							state <= WAIT_READ_FINISH;
						end	

						if(is_write) begin
`ifdef PERF_COUNTER
							store_cycles <= store_cycles + 1;

`endif
							state <= WAIT_WRITE_FINISH;
						end
					end
				end
				WAIT_READ_FINISH:
				begin
`ifdef PERF_COUNTER
					load_cycles <= load_cycles + 1;
`endif
					if(S_LSPCU_LSU_rdata_tvalid) begin
						lsu_value_ready <= 1'b1;
						state <= IDLE;
					end
				end
				WAIT_WRITE_FINISH:
				begin
`ifdef PERF_COUNTER
					store_cycles <= store_cycles + 1;

`endif
					if(S_LSPCU_LSU_wdata_tvalid) begin
						lsu_value_ready <= 1'b1;
						state <= IDLE;
					end
				end
			endcase
		end
	end


	 wire [31:0] phaddr;
	 fmt ls_fmt(
		 .vaddr(addr),
		 .phaddr(phaddr)
	 );


	`msg_put(LSU_LSPCU_rdata, rdata_addr, phaddr);
	`msg_put(LSU_LSPCU_wdata, wdata_addr, phaddr);
	`msg_put(LSU_LSPCU_wdata, wdata, data_to_mem);
	`msg_put(LSU_LSPCU_wdata, wdata_byte_en, mem_byte_wen);


	assign M_LSU_LSPCU_wdata_tvalid = lsu_en & is_write;
	assign M_LSU_LSPCU_rdata_tvalid = lsu_en & is_read;

	`msg_put(LSU_ISU_forward, val, data_to_reg);
	`msg_put(LSU_ISU_forward, rd_byte_wen, rd_byte_wen);
	assign M_LSU_ISU_forward_tvalid  = P_ISU_LSU_datain_valid;
	
	`msg_put(LSU_WBU_res, val, data_to_reg);
	`msg_put(LSU_WBU_res, rd, rd);
	`msg_put(LSU_WBU_res, rd_byte_wen, rd_byte_wen);
	`msg_put(LSU_WBU_res, ls_addr, addr);

	`msglen_wire(ISU_LSU_datain, ETW, new_etw);
    `ET_Append2(new_etw, old_etw, `ET_AdEL_LD, bad_addrl, `ET_AdES, bad_addrs);

	`msg_put(LSU_WBU_res, PC, PC);
	`msg_put(LSU_WBU_res, is_delayslot, is_delayslot);
	`msg_put(LSU_WBU_res, branch_id, branch_id);
	`msg_put(LSU_WBU_res, ETW, new_etw);

`ifdef PERF_COUNTER	
	assign load = lsu_en & is_read & (state == IDLE);
	assign store = lsu_en & is_write & (state == IDLE);
`endif

	assign M_LSU_WBU_res_tvalid = (is_finished | (bad_addrl | bad_addrs)) & P_ISU_LSU_datain_valid & !flushed;
endmodule
