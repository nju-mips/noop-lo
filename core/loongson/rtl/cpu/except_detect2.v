/*
alu_lf ��alu������lf
alu_of ��alu������of
alu_zf ��alu������zf
trap ��idex��ˮ�μĴ������idex_trap
overflow_detect ��idex��ˮ�μĴ������idex_overflow_detect
excepttype_in ��idex��ˮ�μĴ������idex_excepttype
condition ��idex��ˮ�μĴ������idex_condition

excepttype_out ��exmem��ˮ�μĴ�������excepttype_in
 */
`include "excepttions.vh"

/*
Branch
== : 001
>= : 011
< : 110
!= : 010 
 */
`define 	Equal			3'b001
`define 	NotEqual		3'b010
`define		GreaterEqual	3'b011
`define 	Less			3'b110

module except_detect2(
		input 				alu_lf,
		input				alu_of,
		input 				alu_zf,
		input				trap,
		input				overflow_detect,
		input[31:0]			excepttype_i,
		input[2:0]			condition,

		output reg[31:0]	excepttype_o
	);
	always@(*) begin
	   excepttype_o = excepttype_i;
		if(overflow_detect == 1'b1 && alu_of == 1'b1) begin
			excepttype_o[`bit_Ov] = 1'b1;
		end
		else begin
			excepttype_o[`bit_Ov] = 1'b0;
		end
		if(trap == 1'b1) begin
			if( (condition == `Equal && alu_zf == 1'b1) ||
				(condition == `NotEqual && alu_zf == 1'b0) ||
				(condition == `GreaterEqual && alu_lf == 1'b0) ||
				(condition == `Less && alu_lf == 1'b1) ) begin
					excepttype_o[`bit_Tr] = 1'b1;
				end
			else begin
				excepttype_o[`bit_Tr] = 1'b0;
			end
		end
	end
endmodule