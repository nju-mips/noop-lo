/*
 syscall_i �������������idex_syscall
 eret �������������idex_eret
 invalid_inst_i �������������invalid_inst
 excepttype_o ��idex��ˮ�μĴ�����idex_excepttype_in
 */
`include "excepttions.vh"

module except_detect1(
		input 				syscall_i,
		input				eret_i,
		input 				invalid_inst_i,
		input 				break_i,
		input [31:0]		excepttype_i,

		output reg[31:0]	excepttype_o
	);
	always@(*) begin
		excepttype_o = excepttype_i;
		if(syscall_i == 1'b1) begin
			excepttype_o[`bit_Sys] = 1'b1;
		end
		else begin
			excepttype_o[`bit_Sys] = 1'b0;
		end
		if(eret_i == 1'b1) begin
			excepttype_o[`bit_eret] = 1'b1;
		end
		else begin
			excepttype_o[`bit_eret] = 1'b0;
		end
		if(invalid_inst_i == 1'b1) begin
			excepttype_o[`bit_Ri] = 1'b1;
		end
		else begin
			excepttype_o[`bit_Ri] = 1'b0;
		end
		if (break_i == 1'b1) begin
			excepttype_o[`bit_Bp] = 1'b1;
		end
		else begin
			excepttype_o[`bit_Bp] = 1'b0;
		end
	end
endmodule