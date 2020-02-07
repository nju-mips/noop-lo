`include "excepttions.vh"

`define  Syn_except(ExcCode)\
begin\
	cp0_mem0[cp0_status][1] <= 1'b1;\
	cp0_mem0[cp0_cause][6:2] <= ExcCode;\
	if(is_in_delay_slot == 1'b1) begin\
		cp0_mem0[cp0_cause][31] <= 1;\
		cp0_mem0[cp0_epc] <= current_inst_addr_i - 4;\
	end\
	else begin\
		cp0_mem0[cp0_cause][31] <= 0;\
		cp0_mem0[cp0_epc] <= current_inst_addr_i;\
	end\
end


module cp0(
	input 			reset,
	input			clk,
	input			w_en_i,
	input[4:0]		w_addr_i,
	input[31:0]		data_i,
	input[4:0]		r_addr_i,
	input[7:0]		int_i,
	input[31:0]		excepttype_i,
	input[31:0]		current_inst_addr_i,
	input			is_in_delay_slot,

	input[2:0]		read_sel_i,
	input[2:0]		write_sel_i,
	input[31:0]		load_store_addr_i,
	input[31:0]     branch_addr_i,
	input			except_handle_i,

	output reg[31:0]	data_o,
	output reg[31:0]	status_o,
	output reg[31:0]	cause_o,
	output reg[31:0]	epc_o,
	output reg			time_int_o
	);
parameter	cp0_badvaddr = 8,
cp0_count = 9,
cp0_compare = 11,
//sel0
cp0_status = 12,
//sel1
cp0_cause = 13,
cp0_epc = 14;


	//sel = 0
	reg[31:0] 		cp0_mem0[31:0];
	//sel = 1
	reg[31:0]		cp0_mem1[31:0];
	
	/*
	assign cp0_status_cu0 	= 	cp0_status[28];
	assign cp0_status_im 	= 	cp0_status[15:8];
	assign cp0_status_exl 	= 	cp0_status[1];
	assign cp0_status_ie 	= 	cp0_status[0];

	assign cp0_cause_bd 	= 	cp0_cause[31];
	assign cp0_cause_ip 	= 	cp0_cause[15:8];
	assign cp0_cause_exccode = 	cp0_cause[6:2];
	*/
	initial begin
		cp0_mem0[cp0_badvaddr]	=	32'h0;
		cp0_mem0[cp0_count] 	=	32'h0;
		cp0_mem0[cp0_compare]	=	32'h0;
		cp0_mem0[cp0_status] 	=	32'h1000ff01;
		cp0_mem0[cp0_cause] 	=	32'h0;
		cp0_mem0[cp0_epc]		=	32'h0;
		cp0_mem1[cp0_count] 	= 	32'b0;
		time_int_o  			=   1'b0;
	end
    always@(*) begin
        status_o = ((w_en_i == 1'b1) && (w_addr_i == cp0_status)) ? data_i : cp0_mem0[cp0_status];
        cause_o  = ((w_en_i == 1'b1) && (w_addr_i == cp0_cause))  ? data_i : cp0_mem0[cp0_cause];
        epc_o    = ((w_en_i == 1'b1) && (w_addr_i == cp0_epc))    ? data_i : cp0_mem0[cp0_epc];
    end
    
    //Wirte in
	always@(posedge clk) begin
		if(reset == 1'b1) begin
			cp0_mem0[cp0_count] 		<=	32'h0;
			cp0_mem0[cp0_compare]		<=	32'h0;
			cp0_mem0[cp0_status] 		<=	32'h1000ff01;
			cp0_mem0[cp0_cause] 		<=	32'h0;
			cp0_mem0[cp0_epc]			<=	32'h0;
		end
		else begin
			//count寄存??
			if(cp0_mem0[cp0_count] == 32'hffffffff) begin
				cp0_mem0[cp0_count] 	<= 32'h0;
				cp0_mem1[cp0_count] 	<= cp0_mem1[cp0_count] + 32'b1;
			end
			else begin
				cp0_mem0[cp0_count] 	<= cp0_mem0[cp0_count] + 32'b1;
			end
			//compare寄存??
			if(cp0_mem0[cp0_compare] != 0 && cp0_mem0[cp0_compare] == cp0_mem0[cp0_count]) begin
				time_int_o <= 1'b1;
			end
         
			//mtc0
			if(w_en_i == 1'b1) begin
				if(write_sel_i == 3'b0) begin
					case(w_addr_i)
						32'h9: cp0_mem0[cp0_count] 	<= data_i;
						32'hb: begin cp0_mem0[cp0_compare] <= data_i; time_int_o <= 1'b0; end
						32'hc: cp0_mem0[cp0_status] 	<= data_i;
						32'hd: cp0_mem0[cp0_cause] 	<= data_i;
						32'he: cp0_mem0[cp0_epc] 	<= data_i;
					endcase
				end
				else if(write_sel_i == 3'b1) begin
					case(w_addr_i)
						32'h9: cp0_mem1[cp0_count] <= data_i;
					endcase
				end				
			end

			
			//中断
			cp0_mem0[cp0_cause][15:8] 	<=	int_i;
			
			//异常，存在中断异常且该指令不是气泡时进行处理
			if(excepttype_i != `encode_None && except_handle_i == 1'b1 && !cp0_mem0[cp0_status][1]) begin
				if( excepttype_i == `encode_Int0 || 
					excepttype_i == `encode_Int1 ||
					excepttype_i == `encode_Int2 ||
					excepttype_i == `encode_Int3 ||
					excepttype_i == `encode_Int4 ||
					excepttype_i == `encode_Int5 ||
					excepttype_i == `encode_Int6 ||
					excepttype_i == `encode_Int7)
					`Syn_except(`Exc_Int)
				else begin
					case(excepttype_i)
						`encode_AdEL_if:begin 
							cp0_mem0[cp0_badvaddr] <= branch_addr_i;
							`Syn_except(`Exc_AdEL)
						end
						`encode_Sys:`Syn_except(`Exc_Sys)
						`encode_Ri:`Syn_except(`Exc_Ri)
						`encode_Ov:`Syn_except(`Exc_Ov)
						`encode_Tr:`Syn_except(`Exc_Tr)
						`encode_Bp:`Syn_except(`Exc_Bp)
						`encode_AdEL_ld:begin
							cp0_mem0[cp0_badvaddr] <= load_store_addr_i;
							`Syn_except(`Exc_AdEL)
						end
						`encode_AdES:begin
							cp0_mem0[cp0_badvaddr] <= load_store_addr_i;
							`Syn_except(`Exc_AdES)
						end
						`encode_eret: /*eret*/cp0_mem0[cp0_status][1] <= 1'b0;
					endcase
				end
			end
			if(excepttype_i == `encode_eret) begin
			     cp0_mem0[cp0_status][1] <= 1'b0;
			end
		end
	end

	//read out
	always@(*) begin
		//mfc0
		if(read_sel_i == 3'b0) begin
			case(r_addr_i)
				32'h8: data_o = cp0_mem0[cp0_badvaddr];
				32'h9: data_o = (w_en_i == 1'b1 && write_sel_i == read_sel_i && w_addr_i == r_addr_i) ? data_i : cp0_mem0[cp0_count];
				32'hb: data_o = (w_en_i == 1'b1 && write_sel_i == read_sel_i && w_addr_i == r_addr_i) ? data_i : cp0_mem0[cp0_compare];
				32'hc: data_o = (w_en_i == 1'b1 && write_sel_i == read_sel_i && w_addr_i == r_addr_i) ? data_i : cp0_mem0[cp0_status];
				32'hd: data_o = (w_en_i == 1'b1 && write_sel_i == read_sel_i && w_addr_i == r_addr_i) ? data_i : cp0_mem0[cp0_cause];
				32'he: data_o = (w_en_i == 1'b1 && write_sel_i == read_sel_i && w_addr_i == r_addr_i) ? data_i : cp0_mem0[cp0_epc];
				default: data_o = 32'h0;
			endcase
		end
		else if(read_sel_i == 3'b1) begin
			case(r_addr_i)
				32'h9: data_o = (w_en_i == 1'b1 && write_sel_i == read_sel_i && w_addr_i == r_addr_i) ? data_i : cp0_mem1[cp0_count];
				default: data_o = 32'h0;
			endcase
		end
		else begin
			data_o = 32'h0;
		end
	end

endmodule