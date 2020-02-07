
`include "excepttions.vh"

module interrupt_except_handle(
		input[31:0] 		cp0_status_i,
		input[31:0] 		cp0_cause_i,
		input[31:0]			excepttype_i,
		//气泡处理
		input 				current_inst_is_nop_i,
		//编码转换
		output reg [31:0]			excepttype_o,

		//访存限制
		output reg 			store_enable,
		output reg 			load_enable
	);
	//中断处理
	wire[31:0] 	excepttype;
	assign excepttype[31:8] = excepttype_i[31:8];
	//interrupt 7~0
	assign excepttype[`bit_Int7] = cp0_cause_i[15] & cp0_status_i[15] & !cp0_status_i[1] & cp0_status_i[0];
	assign excepttype[`bit_Int6] = cp0_cause_i[14] & cp0_status_i[14] & !cp0_status_i[1] & cp0_status_i[0];
	assign excepttype[`bit_Int5] = cp0_cause_i[13] & cp0_status_i[13] & !cp0_status_i[1] & cp0_status_i[0];
	assign excepttype[`bit_Int4] = cp0_cause_i[12] & cp0_status_i[12] & !cp0_status_i[1] & cp0_status_i[0];
	assign excepttype[`bit_Int3] = cp0_cause_i[11] & cp0_status_i[11] & !cp0_status_i[1] & cp0_status_i[0];
	assign excepttype[`bit_Int2] = cp0_cause_i[10] & cp0_status_i[10] & !cp0_status_i[1] & cp0_status_i[0];
	assign excepttype[`bit_Int1] = cp0_cause_i[9] & cp0_status_i[9] & !cp0_status_i[1] & cp0_status_i[0];
	assign excepttype[`bit_Int0] = cp0_cause_i[8] & cp0_status_i[8] & !cp0_status_i[1] & cp0_status_i[0];

	always@(*) begin
		if(current_inst_is_nop_i == 1'b1) begin
			excepttype_o = `encode_None;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if(excepttype[`bit_Int0] == 1'b1) begin
			excepttype_o = `encode_Int0;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_Int1] == 1'b1) begin
			excepttype_o = `encode_Int1;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_Int2] == 1'b1) begin
			excepttype_o = `encode_Int2;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_Int3] == 1'b1) begin
			excepttype_o = `encode_Int3;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_Int4] == 1'b1) begin
			excepttype_o = `encode_Int4;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_Int5] == 1'b1) begin
			excepttype_o = `encode_Int5;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_Int6] == 1'b1) begin
			excepttype_o = `encode_Int6;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_Int7] == 1'b1) begin
			excepttype_o = `encode_Int7;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
		else if (excepttype[`bit_AdEL_if] == 1'b1) begin
			excepttype_o = `encode_AdEL_if;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_Sys] == 1'b1) begin
			excepttype_o = `encode_Sys;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_Ri] == 1'b1) begin
			excepttype_o = `encode_Ri;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_Ov] == 1'b1) begin
			excepttype_o = `encode_Ov;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_Tr] == 1'b1) begin
			excepttype_o = `encode_Tr;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_Bp] == 1'b1) begin
			excepttype_o = `encode_Bp;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_AdEL_ld] == 1'b1) begin
			excepttype_o = `encode_AdEL_ld;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_AdES] == 1'b1) begin
			excepttype_o = `encode_AdES;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else if (excepttype[`bit_eret] == 1'b1) begin
			excepttype_o = `encode_eret;
			store_enable = 1'b0;
			load_enable = 1'b0;
		end
		else begin
			excepttype_o = 32'h0;
			store_enable = 1'b1;
			load_enable = 1'b1;
		end
	end


endmodule