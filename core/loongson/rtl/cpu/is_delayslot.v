/*
 is_jmp 接idex流水段寄存器输出ex_jmp
 is_jr  接idex流水段寄存器输出ex_jr
 is_branch  接idex流水段寄存器输出idex_branch

 is_in_delay_slot 接idex流水段寄存器输入idex_is_in_delayslot
 */

module is_delayslot(
		input		is_jmp,
		input		is_jr,
		input		is_branch,
		output reg	is_in_delay_slot
	);

	always@(*) begin
		if(is_jmp == 1'b1 || is_jr == 1'b1 || is_branch == 1'b1) begin
			is_in_delay_slot = 1'b1;
		end
		else begin
			is_in_delay_slot = 1'b0;
		end
	end

endmodule