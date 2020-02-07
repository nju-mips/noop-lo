`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2016 02:36:02 PM
// Design Name: 
// Module Name: final_target
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module final_target(
	input exmem_branch,
	input [2:0] exmem_condition,
	input [31:0] exmem_target,
	input [31:0] exmem_pc_4,
	input exmem_lf,
	input exmem_zf,
	output reg [31:0] final_target,
	output reg branch_state
);

	always@(*)
	begin
		if(exmem_branch == 1'b0)
		begin
			final_target = exmem_pc_4;
			branch_state = 1'b0;
	    end
		else if(exmem_condition == 3'b000)
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
	    end
		else if((exmem_condition == 3'b001) && (exmem_zf == 1'b1))
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
		end
		else if((exmem_condition == 3'b010) && (exmem_zf == 1'b0))
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
		end
		else if((exmem_condition == 3'b011) && (exmem_lf == 1'b0))
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
		end
		else if((exmem_condition == 3'b100) && (exmem_zf == 1'b0) && (exmem_lf == 1'b0))
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
		end
		else if((exmem_condition == 3'b101) && ((exmem_zf == 1'b1) || (exmem_lf == 1'b1)))
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
		end
		else if((exmem_condition == 3'b110) && (exmem_lf == 1'b1))
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
		end
		else if(exmem_condition == 3'b111)
		begin
			final_target = exmem_target;
			branch_state = 1'b1;
		end
		else
		begin
			final_target = exmem_pc_4 + 4;
			branch_state = 1'b0;
		end
	end
	
endmodule