`include "axis.vh"
`include "msg_if.vh"
`include "common.vh"
`include "exception.vh"

module cp0 # (
`include "msg_param.vh"
) (
	input clk,
	input rst,

	input [7:0] interrupt,

	// Exception Interface
	`msg_master_if(CP0_WBU_exception),
	`msg_slave_if(WBU_CP0_exception),

	// Data Interface
	`msg_master_if(CP0_ISU_rdata),
	`msg_slave_if(ISU_CP0_rw)
);
	`msglen_wire(WBU_CP0_exception, etw, etw);
	`msglen_wire(WBU_CP0_exception, cur_inst_addr, cur_inst_addr);
	`msglen_wire(WBU_CP0_exception, badvaddr, badvaddr);
	`msglen_wire(WBU_CP0_exception, isdelayslot, isdelayslot);
	`msglen_wire(WBU_CP0_exception, valid, inst_valid);
	`msglen_wire(WBU_CP0_exception, exception_handle, exception_handle);
	`msglen_wire(WBU_CP0_exception, int_enable, int_enable);
	`msglen_wire(ISU_CP0_rw, rsel, rsel);
	`msglen_wire(ISU_CP0_rw, rrd, raddr);
	`msglen_wire(ISU_CP0_rw, wen, wen);
	`msglen_wire(ISU_CP0_rw, wsel, wsel);
	`msglen_wire(ISU_CP0_rw, wrd, waddr);
	`msglen_wire(ISU_CP0_rw, wval, wdata);

	`msg_get(WBU_CP0_exception, etw, etw);
	`msg_get(WBU_CP0_exception, cur_inst_addr, cur_inst_addr);
	`msg_get(WBU_CP0_exception, badvaddr, badvaddr);
	`msg_get(WBU_CP0_exception, isdelayslot, isdelayslot);
	`msg_get(WBU_CP0_exception, valid, inst_valid);
	`msg_get(WBU_CP0_exception, exception_handle, exception_handle);
	`msg_get(WBU_CP0_exception, int_enable, int_enable);
	`msg_get(ISU_CP0_rw, rsel, rsel);
	`msg_get(ISU_CP0_rw, rrd, raddr);
	`msg_get(ISU_CP0_rw, wen, wen);
	`msg_get(ISU_CP0_rw, wsel, wsel);
	`msg_get(ISU_CP0_rw, wrd, waddr);
	`msg_get(ISU_CP0_rw, wval, wdata);

	`msglen_reg(CP0_WBU_exception, has_exception, has_exception);
	`msglen_reg(CP0_WBU_exception, eret, eret);
	`msglen_reg(CP0_WBU_exception, epc, epc);
	`msglen_reg(CP0_ISU_rdata, val, rdata);


	reg [`DATA_WIDTH - 1:0] cpr0 [2 ** `ADDR_WIDTH - 1:0];
	reg [`DATA_WIDTH - 1:0] cpr1 [2 ** `ADDR_WIDTH - 1:0];
    reg time_int;

	`DATA_VAR_WIRE(new_etw);
	`DATA_VAR_REG(dominate_exc);
	wire[7:0] int_masked;

	// interruption info
	assign int_masked[0] = `INTMASKED(8);
	assign int_masked[1] = `INTMASKED(9);
	assign int_masked[2] = `INTMASKED(10);
	assign int_masked[3] = `INTMASKED(11);
	assign int_masked[4] = `INTMASKED(12);
	assign int_masked[5] = `INTMASKED(13);
	assign int_masked[6] = `INTMASKED(14);
	assign int_masked[7] = `INTMASKED(15);
    `ET_Append8(new_etw,  etw,
                `ET_INT, int_masked[0] & int_enable,
                `ET_INT, int_masked[1] & int_enable,
                `ET_INT, int_masked[2] & int_enable,
                `ET_INT, int_masked[3] & int_enable,
                `ET_INT, int_masked[4] & int_enable,
                `ET_INT, int_masked[5] & int_enable,
                `ET_INT, int_masked[6] & int_enable,
                `ET_INT, int_masked[7] & int_enable
               );


	// priorty
	always@(*) begin
		if(inst_valid == 1'b0) begin
			// interruption cannnot be handled when instruction is nop
			dominate_exc = `PRI_NONE;
			has_exception = 1'b0;
		end
		else if (new_etw[`ETB_INT] === 1'b1) begin
			dominate_exc = `PRI_INT;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_AdEL_IF] === 1'b1) begin
			dominate_exc = `PRI_AdEL_IF;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_SYSCALL] === 1'b1) begin
			dominate_exc = `PRI_SYSCALL;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_INVOP] === 1'b1) begin
			dominate_exc = `PRI_INVOP;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_OV] === 1'b1) begin
			dominate_exc = `PRI_OV;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_TRAP] === 1'b1) begin
			dominate_exc = `PRI_TRAP;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_BP] === 1'b1) begin
			dominate_exc = `PRI_BP;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_AdEL_LD] === 1'b1) begin
			dominate_exc = `PRI_AdEL_LD;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_AdES] === 1'b1) begin
			dominate_exc = `PRI_AdES;
			has_exception = 1'b1;
		end
		else if (new_etw[`ETB_eret] === 1'b1) begin
			dominate_exc = `PRI_eret;
			has_exception = 1'b0;
		end
		else begin
			// no exception
			dominate_exc = `PRI_NONE;
			has_exception = 1'b0;
		end
		eret = new_etw[`ETB_eret] & !has_exception;
	end

	always@(*) begin
		epc = cpr0[`CPR_EPC];
	end

	// process logic
	always@(posedge clk) begin
	    if(rst) begin
            cpr0[`CPR_BadVAddr] <= `CONST_DATA_D(0);
            cpr0[`CPR_Count]    <= `CONST_DATA_D(0);
            cpr0[`CPR_Compare]  <= `CONST_DATA_D(0);
            // interrupt enable bit set by software.
            // it is disabled here. 
            cpr0[`CPR_Status]   <= `CONST_DATA_H(1000ff00);
            cpr0[`CPR_Cause]    <= `CONST_DATA_D(0);
            cpr0[`CPR_EPC]      <= `CONST_DATA_D(0);
            cpr1[`CPR_Count]    <= `CONST_DATA_D(0);
            time_int            <=  1'b0;
        end else if(inst_valid == 1'b1) begin
            // value is assocaited with wbu
            //mtc0
            if(wen) begin
                if(wsel == 0) begin
                    case(waddr)
                        `CPR_Count: cpr0[`CPR_Count] <= wdata;
                        `CPR_Compare: begin cpr0[`CPR_Compare] <= wdata; time_int <= 1'b0; end
                        `CPR_Status: cpr0[`CPR_Status] <= wdata;
                        `CPR_Cause: cpr0[`CPR_Cause] <= wdata;
                        `CPR_EPC: cpr0[`CPR_EPC] <= wdata;
                    endcase
                end
                else if(wsel == 1) begin
                    case(waddr)
                        `CPR_Count: cpr1[`CPR_Count] <= wdata;
                    endcase
                end
            end
        
			// exception
			// PS : Consider there is no delayslot.
			if (dominate_exc != `PRI_NONE && exception_handle == 1'b1) begin
			    if(!cpr0[`CPR_Status][1]) begin
                    case(dominate_exc)
                        `PRI_INT: begin
                            `syn_exc_done(`EC_Int, cur_inst_addr, isdelayslot);
                        end
                        `PRI_AdEL_IF: begin
                            `syn_exc_done(`EC_AdEL, cur_inst_addr, isdelayslot);
                            cpr0[`CPR_BadVAddr] <= badvaddr;
                        end
                        `PRI_SYSCALL: begin
                            `syn_exc_done(`EC_SYSCALL, cur_inst_addr, isdelayslot);
                        end
                        `PRI_INVOP: begin
                            `syn_exc_done(`EC_RI, cur_inst_addr, isdelayslot);
                        end
                        `PRI_OV: begin
                            `syn_exc_done(`EC_OV, cur_inst_addr, isdelayslot);
                        end
                        `PRI_TRAP: begin
                            `syn_exc_done(`EC_TR, cur_inst_addr, isdelayslot);
                        end
                        `PRI_BP: begin
                            `syn_exc_done(`EC_BP, cur_inst_addr, isdelayslot);
                        end
                        `PRI_AdEL_LD: begin
                            `syn_exc_done(`EC_AdEL, cur_inst_addr, isdelayslot);
                            cpr0[`CPR_BadVAddr] <= badvaddr;
                        end
                        `PRI_AdES: begin
                            `syn_exc_done(`EC_AdES, cur_inst_addr, isdelayslot);
                            cpr0[`CPR_BadVAddr] <= badvaddr;
                        end
                        `PRI_eret: begin
                            cpr0[`CPR_Status][1] <= 1'b0;
                        end
                        default:begin
                            // do nothing, can never happen
                        end
				    endcase
				end
				else if(dominate_exc == `PRI_eret) begin
				    cpr0[`CPR_Status][1] <= 1'b0;
				end
			end
		end
		else begin
		    if (cpr0[`CPR_Count] == `CONST_DATA_H(ffffffff)) begin
                cpr0[`CPR_Count] <= `CONST_DATA_H(0);
                cpr1[`CPR_Count] <= cpr1[`CPR_Count] + `CONST_DATA_D(1);
            end
            else begin
                cpr0[`CPR_Count] <= cpr0[`CPR_Count] + `CONST_DATA_D(1);
            end
        
            // time interrupt
            if (cpr0[`CPR_Compare] != `CONST_DATA_H(0) && cpr0[`CPR_Compare] == cpr0[`CPR_Count]) begin
                time_int <= 1'b1;
            end
        
            // interruption
            cpr0[`CPR_Cause][15:8] <= interrupt | {time_int, 7'b0};
		end
	end


	always@(*) begin
		if(rsel == 0) begin
            case(raddr)
                `CPR_BadVAddr: rdata = cpr0[`CPR_BadVAddr];
                `CPR_Count:   rdata = (wsel == rsel && waddr == raddr) ? wdata : cpr0[`CPR_Count];
                `CPR_Compare: rdata = (wsel == rsel && waddr == raddr) ? wdata : cpr0[`CPR_Compare];
                `CPR_Status:  rdata = (wsel == rsel && waddr == raddr) ? wdata : cpr0[`CPR_Status];
                `CPR_Cause:   rdata = (wsel == rsel && waddr == raddr) ? wdata : cpr0[`CPR_Cause];
                `CPR_EPC:     rdata = (wsel == rsel && waddr == raddr) ? wdata : cpr0[`CPR_EPC];
                default:      rdata = `CONST_DATA_D(0);
            endcase
        end
        else if(rsel == 1) begin
            case(raddr)
                `CPR_Count:   rdata = (wsel == rsel && waddr == raddr) ? wdata : cpr1[`CPR_Count];
                default:      rdata = `CONST_DATA_D(0);
            endcase
        end
        else begin
            rdata = `CONST_DATA_D(0);
        end
	end

	`msg_put(CP0_WBU_exception, has_exception, has_exception);
	`msg_put(CP0_WBU_exception, eret, eret);
	`msg_put(CP0_WBU_exception, epc, epc);
	`msg_put(CP0_ISU_rdata, val, rdata);

endmodule
