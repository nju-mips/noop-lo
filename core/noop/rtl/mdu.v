`include "decode.vh"
`include "common.vh"
`include "flush.vh"

module mdu # (
`include "msg_param.vh"
) (
	input  clk,
	input  rst,
`ifdef PERF_COUNTER
	output mul,
	output div,
`endif
	`msg_slave_if(ISU_MDU_datain),
	`msg_master_if(MDU_WBU_res),
	`msg_master_if(MDU_WBU_hilo),

	`msg_master_if(MDU_DIV_divisor),
	`msg_master_if(MDU_DIV_dividend),
	`msg_slave_if(DIV_MDU_res),

	output [`DATA_WIDTH : 0] ext_a,
	output [`DATA_WIDTH : 0] ext_b,
	input [65:0] mult_result,

	`msg_slave_if(WBU_MDU_flush),
	`msg_master_if(MDU_ISU_forward)
);
	// pipeline
	`pipeline_msg_reg(ISU_MDU_datain);
	`pipeline_msg_reg(WBU_MDU_flush);

	// flush
	`msglen_wire(WBU_MDU_flush, kind, flush_kind);
	`msglen_wire(WBU_MDU_flush, branch_id, flush_branch_id);
	`msglen_wire(ISU_MDU_datain, is_delayslot, is_delayslot);
	`msglen_wire(ISU_MDU_datain, branch_id, branch_id);

	`pipeline_msg_get(WBU_MDU_flush, kind, flush_kind);
	`pipeline_msg_get(WBU_MDU_flush, branch_id, flush_branch_id);
	`pipeline_msg_get(ISU_MDU_datain, is_delayslot, is_delayslot);
	`pipeline_msg_get(ISU_MDU_datain, branch_id, branch_id);

	wire flushed;
    reg flush_cond_true;
	`flush_judge(flush_cond_true, flush_kind, is_delayslot, branch_id, flush_branch_id);

	always@(posedge clk) begin
		if(!flushed | S_ISU_MDU_datain_tready) begin
			`pipeline_msg_get_reg(WBU_MDU_flush)
		end
	end

	// control
	// value: 
	//        nop :     P_valid = 1'b0   (rst| ....)
	//        flushed : inst be flushed
	//        passed :  send value to next unit

    	wire nop;
	reg passed;
	assign flushed = flush_cond_true & P_WBU_MDU_flush_valid;
	assign nop = !P_ISU_MDU_datain_valid;


	reg mdu_value_ready, start_run;
	wire is_finished = !start_run & mdu_value_ready;
	always@(posedge clk) begin
		`pipeline_msg_get_if(rst)
			`pipeline_msg_get_flush(ISU_MDU_datain)
			start_run <= 1'b1;
		`pipeline_msg_else
			if(S_ISU_MDU_datain_tready) begin
				`pipeline_msg_get_reg(ISU_MDU_datain)
				start_run <= 1'b1;
				passed <= 1'b0;
			end
			else if (M_MDU_WBU_res_tvalid & M_MDU_WBU_res_tready) begin
				passed <= 1'b1;
				start_run <= 1'b0;
			end
			else begin
				start_run <= 1'b0;
			end
		`pipeline_msg_get_end
	end

	assign S_ISU_MDU_datain_tready = M_MDU_WBU_res_tvalid & M_MDU_WBU_res_tready | nop | passed | flushed;

	`msglen_wire(ISU_MDU_datain, A, A);
	`msglen_wire(ISU_MDU_datain, B, B);
	`msglen_wire(ISU_MDU_datain, fu_op, fu_op);
	`msglen_wire(ISU_MDU_datain, rd, rd);
	`msglen_wire(ISU_MDU_datain, PC, PC);
	`msglen_wire(ISU_MDU_datain, ETW, old_etw);
	`msglen_wire(MDU_WBU_res, ETW, new_etw);

	`pipeline_msg_get(ISU_MDU_datain, A, A);
	`pipeline_msg_get(ISU_MDU_datain, B, B);
	`pipeline_msg_get(ISU_MDU_datain, fu_op, fu_op);
	`pipeline_msg_get(ISU_MDU_datain, rd, rd);
	`pipeline_msg_get(ISU_MDU_datain, PC, PC);
    `pipeline_msg_get(ISU_MDU_datain, ETW, old_etw);


  `msglen_reg(DIV_MDU_res, div_result, div_result);

	reg a_ext_bit, b_ext_bit;
	always@(*) begin
		case(fu_op)
			`FU_OP_MDU_MUL:	begin
				a_ext_bit = A[`DATA_WIDTH - 1];
				b_ext_bit = B[`DATA_WIDTH - 1];
			end
			`FU_OP_MDU_MULT: begin
				a_ext_bit = A[`DATA_WIDTH - 1];
				b_ext_bit = B[`DATA_WIDTH - 1];
			end
			`FU_OP_MDU_MULTU: begin
				a_ext_bit = 0;
				b_ext_bit = 0;
			end
			`FU_OP_MDU_DIV:	begin
				a_ext_bit = A[`DATA_WIDTH - 1];
				b_ext_bit = B[`DATA_WIDTH - 1];
			end
			`FU_OP_MDU_DIVU: begin
				a_ext_bit = 0;
				b_ext_bit = 0;
			end
			default: begin
				a_ext_bit = 0;
				b_ext_bit = 0;
			end
		endcase
	end

	assign ext_a = { a_ext_bit, A };
	assign ext_b = { b_ext_bit, B };
	
	`msg_put(MDU_DIV_dividend, ext_a, {{8{a_ext_bit}}, A});
	`msg_put(MDU_DIV_divisor, ext_b,{{8{b_ext_bit}}, B});

	`msg_put(MDU_DIV_dividend, ext_a, {{8{a_ext_bit}}, A});
	`msg_put(MDU_DIV_divisor, ext_b,{{8{b_ext_bit}}, B});

	wire is_div = (fu_op == `FU_OP_MDU_DIV) || (fu_op == `FU_OP_MDU_DIVU);
	wire is_mul = (fu_op == `FU_OP_MDU_MUL) ||
		(fu_op == `FU_OP_MDU_MULT) ||
		(fu_op == `FU_OP_MDU_MULTU);


    

	reg [2 * `DATA_WIDTH - 1 : 0] res;
	always@(*) begin
		case(fu_op)
			`FU_OP_MDU_MUL:		res[0 +: `DATA_WIDTH] = mult_result[0 +: `DATA_WIDTH];
			`FU_OP_MDU_MULT:	res = mult_result[0 +: 2 * `DATA_WIDTH];
			`FU_OP_MDU_MULTU:	res = mult_result[0 +: 2 * `DATA_WIDTH];
			`FU_OP_MDU_MFHI:	res[0 +: `DATA_WIDTH] = A;
			`FU_OP_MDU_MFLO:	res[0 +: `DATA_WIDTH] = A;
			`FU_OP_MDU_DIV:		res = { div_result[0 +: `DATA_WIDTH], div_result[40 +:`DATA_WIDTH] };
			`FU_OP_MDU_DIVU:	res = { div_result[0 +: `DATA_WIDTH], div_result[40 +:`DATA_WIDTH] };
			`FU_OP_MDU_MTHI:    res = { A, {`DATA_WIDTH{1'b0}} };
			`FU_OP_MDU_MTLO:    res = { {`DATA_WIDTH{1'b0}}, A };
			default:	res = { 2 * `DATA_WIDTH {1'b0}};
		endcase
	end

	
	reg [2:0] state;
	reg [3:0] cnt;
	parameter IDLE = 0, WAIT_BOTH_READY = 1,
	WAIT_DIVISOR_READY = 2, WAIT_DIVIDEND_READY= 3, 
	WAIT_RES_VALID = 4,  COUNT = 5, FINISH = 6;
	
	reg divisor_valid;
	reg dividend_valid;
	
	wire mdu_en = P_ISU_MDU_datain_valid & !is_finished & !nop & !S_WBU_MDU_flush_tvalid & !rst & !flushed;
	
	parameter mul_clks = 6;
	
	always @(posedge clk) begin
	   if(rst) begin
	       state <= IDLE;
	       divisor_valid <= 1'b0;
           dividend_valid <= 1'b0;
	       mdu_value_ready <= 1'b0;
	   end 
	   else if (S_ISU_MDU_datain_tready) begin
	   	   mdu_value_ready <= 1'b0;
	   end
	   else begin
	       case(state)
	           IDLE:  if(mdu_en) begin
	               if(is_div) begin
	                   divisor_valid <= 1'b1;
	                   dividend_valid <= 1'b1;
	                   mdu_value_ready <= 1'b0;
	                   state <= WAIT_BOTH_READY;
	               end else if(is_mul) begin
	                   cnt <= 0;
	                   mdu_value_ready <= 1'b0;
	                   state <= COUNT;
	               end else begin
	                   mdu_value_ready <= 1'b0;
	                   state <= FINISH;
	               end
	           end
	           
	           WAIT_BOTH_READY: 
                   if(M_MDU_DIV_divisor_tready & M_MDU_DIV_dividend_tready) begin
                        divisor_valid <= 1'b0;
                        dividend_valid <= 1'b0;
                        mdu_value_ready <= 1'b0;
                        state <= WAIT_RES_VALID;    
                   end 
                   else begin
                        if(M_MDU_DIV_divisor_tready) begin
                            divisor_valid <= 1'b0;
                            dividend_valid <= 1'b1;
                            mdu_value_ready <= 1'b0;
                            state <= WAIT_DIVIDEND_READY; 
                        end
                        
                        if(M_MDU_DIV_dividend_tready) begin
                            divisor_valid <= 1'b1;
                            dividend_valid <= 1'b0;
                            mdu_value_ready <= 1'b0;
                            state <= WAIT_DIVISOR_READY; 
                        end
                   
                   end
                
               WAIT_DIVISOR_READY:
                   if(M_MDU_DIV_divisor_tready) begin
                       divisor_valid <= 1'b0;
                       dividend_valid <= 1'b0;
                       mdu_value_ready <= 1'b0;
                       state <= WAIT_RES_VALID;  
                   end   
               WAIT_DIVIDEND_READY:
                   if(M_MDU_DIV_dividend_tready) begin
                       divisor_valid <= 1'b0;
                       dividend_valid <= 1'b0;
                       mdu_value_ready <= 1'b0;
                       state <= WAIT_RES_VALID;  
                   end
               
               WAIT_RES_VALID:
                    if(S_DIV_MDU_res_tvalid) begin
                        divisor_valid <= 1'b0;
                        dividend_valid <= 1'b0;
                        `msg_get_reg(DIV_MDU_res, div_result, div_result);
                        mdu_value_ready <= 1'b0;
                        state <= FINISH;
                    end
	           COUNT: begin
	               if(cnt == mul_clks) begin
		               mdu_value_ready <= 1'b0;
	                   state <= FINISH;
	               end else begin
	                   cnt <= cnt + 1;
	                   mdu_value_ready <= 1'b0;
	               end
	           end
	           
	           FINISH: begin
		           mdu_value_ready <= 1'b1;
	               state <= IDLE;
	           end
	       endcase
	   end
	end

	assign M_MDU_DIV_divisor_tvalid = divisor_valid;
	assign M_MDU_DIV_dividend_tvalid = dividend_valid;
	
	assign S_DIV_MDU_res_tready = 1'b1;
	
	
	`msglen_wire(MDU_WBU_res, rd_wen, rd_wen);
	assign rd_wen = (fu_op == `FU_OP_MDU_MUL) ||
		(fu_op == `FU_OP_MDU_MFHI) ||
		(fu_op == `FU_OP_MDU_MFLO);

	wire hilo_wen = (fu_op == `FU_OP_MDU_MULT) ||
		(fu_op == `FU_OP_MDU_MULTU) ||
		(fu_op == `FU_OP_MDU_DIV) ||
		(fu_op == `FU_OP_MDU_DIVU) ||
		(fu_op == `FU_OP_MDU_MTHI) ||
		(fu_op == `FU_OP_MDU_MTLO);

	// hi_wen/lo_wen
	`msglen_reg(MDU_WBU_hilo, hi_wen, hi_wen);
	`msglen_reg(MDU_WBU_hilo, lo_wen, lo_wen);
	always@(*) begin
		case(fu_op)
			`FU_OP_MDU_MULT: begin
				hi_wen = 1'b1;
				lo_wen = 1'b1;
			end
			`FU_OP_MDU_MULTU: begin
				hi_wen = 1'b1;
				lo_wen = 1'b1;
			end
			`FU_OP_MDU_DIV: begin
				hi_wen = 1'b1;
				lo_wen = 1'b1;
			end
			`FU_OP_MDU_DIVU: begin
				hi_wen = 1'b1;
				lo_wen = 1'b1;
			end
			`FU_OP_MDU_MTHI: begin
				hi_wen = 1'b1;
				lo_wen = 1'b0;
			end
			`FU_OP_MDU_MTLO: begin
				hi_wen = 1'b0;
				lo_wen = 1'b1;
			end
			default: begin
				hi_wen = 1'b0;
				lo_wen = 1'b0;
			end
		endcase
	end


	`msg_put(MDU_WBU_res, val, res[0 +: `DATA_WIDTH]);
	`msg_put(MDU_WBU_res, rd, rd);
	`msg_put(MDU_WBU_res, rd_wen, rd_wen);

	`msg_put(MDU_WBU_hilo, hi, res[`DATA_WIDTH  +: `DATA_WIDTH]);
	
	`msg_put(MDU_WBU_hilo, lo, res[0 +: `DATA_WIDTH]);
	`msg_put(MDU_WBU_hilo, hi_wen, hi_wen);
	`msg_put(MDU_WBU_hilo, lo_wen, lo_wen);


	`DATA_VAR_WIRE(forward_data);
	wire[3:0] forward_byte_wen;
	assign forward_data     = rd_wen | lo_wen ? res[0 +: `DATA_WIDTH] : (hi_wen ? res[`DATA_WIDTH  +: `DATA_WIDTH] : `CONST_DATA_H(0));
	assign forward_byte_wen = {4{rd_wen|lo_wen|hi_wen}};
	`msg_put(MDU_ISU_forward, val, forward_data);
	`msg_put(MDU_ISU_forward, rd_byte_wen, forward_byte_wen);
	assign M_MDU_ISU_forward_tvalid  = P_ISU_MDU_datain_valid;
	
	assign new_etw = old_etw;

	`msg_put(MDU_WBU_res, PC, PC);
	`msg_put(MDU_WBU_res, is_delayslot, is_delayslot);
	`msg_put(MDU_WBU_res, branch_id, branch_id);
	`msg_put(MDU_WBU_res, ETW, new_etw);

	
	//for performancd counter
`ifdef PERF_COUNTER
	assign mul = (state == IDLE) & mdu_en & is_mul;
	assign div = (state == IDLE) & mdu_en & is_div;
`endif

	assign M_MDU_WBU_res_tvalid  = is_finished & P_ISU_MDU_datain_valid & !flushed;
	assign M_MDU_WBU_hilo_tvalid = hilo_wen & is_finished & P_ISU_MDU_datain_valid & !flushed;
endmodule
