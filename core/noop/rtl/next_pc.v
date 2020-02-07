`include "axis.vh"
`include "msg_if.vh"
`include "common.vh"
`include "decode.vh"
`include "flush.vh"       
`include "exception.vh"

module next_pc(
		input					clk,
		input					rst,
		input[`DATA_WIDTH-1:0]  instr,
		input[`DATA_WIDTH-1:0]  pc,
		input					inst_valid,
		input					nextu_ready,
		
		
		// branch
		input                   branch_valid,
		input                   has_exception,
		input                   is_taken,
		input[`DATA_WIDTH-1:0]  br_target,
		output reg              branch_ready,         	

        // controller
		output reg[`DATA_WIDTH-1:0] next_pc,
		output				        isdelayslot,
		output[`BRANCH_ID_BIT-1:0] branch_id
	);

	// decode
	wire[5:0] opcode = instr[31:26];
	wire[4:0] rt = instr[20:16];
	wire[5:0] func = instr[5:0];

	reg[8:0] lookup_idx;

	always@(*) begin
		if(opcode == `OPCODE_SPECIAL) begin
			lookup_idx= {`INSTR_TYPE_SPECIAL, func};
		end
		else if (opcode == `OPCODE_REGIMM) begin
			lookup_idx = {`INSTR_TYPE_REGIMM, 1'b0, rt};
		end
		else begin
			lookup_idx = {`INSTR_TYPE_COMMON, opcode};
		end
	end


	reg is_branch;
	always @(*) begin
		case(lookup_idx)
			/* BGEZAL*/  {`INSTR_TYPE_REGIMM, 6'b010001}: is_branch = 1'b1;
			/* BLTZAL*/  {`INSTR_TYPE_REGIMM, 6'b010000}: is_branch = 1'b1;
			/* BEQ   */  {`INSTR_TYPE_COMMON, 6'b000100}: is_branch = 1'b1;
			/* BGEZ  */  {`INSTR_TYPE_REGIMM, 6'b000001}: is_branch = 1'b1;
			/* BGTZ  */  {`INSTR_TYPE_COMMON, 6'b000111}: is_branch = 1'b1;
			/* BLEZ  */  {`INSTR_TYPE_COMMON, 6'b000110}: is_branch = 1'b1;
			/* BLTZ  */  {`INSTR_TYPE_REGIMM, 6'b000000}: is_branch = 1'b1;
			/* BNE   */  {`INSTR_TYPE_COMMON, 6'b000101}: is_branch = 1'b1;
			/* J     */  {`INSTR_TYPE_COMMON, 6'b000010}: is_branch = 1'b1;
			/* JAL   */  {`INSTR_TYPE_COMMON, 6'b000011}: is_branch = 1'b1;
			/* JALR  */  {`INSTR_TYPE_SPECIAL, 6'b001001}: is_branch = 1'b1;
			/* JR    */  {`INSTR_TYPE_SPECIAL, 6'b001000}: is_branch = 1'b1;
			default:      is_branch = 1'b0;
		endcase
	end


	// next pc
	always@(*) begin
	   if(branch_valid == 1'b1) begin
           if(has_exception == 1'b1) begin
               next_pc = `EXCEPTION_ENTRY;
               branch_ready = 1'b1;
           end
           else if (is_taken == 1'b1) begin
               next_pc = br_target;
               branch_ready = 1'b1;
           end
           else begin
               next_pc = (pc + `CONST_DATA_D(4));
               branch_ready = 1'b0;
           end
       end
       else if(is_branch == 1'b1) begin
	       next_pc = (pc + `CONST_DATA_D(4));
	       branch_ready = 1'b0;
	   end
       else begin
           next_pc = (pc + `CONST_DATA_D(4));
           branch_ready = 1'b0;    
       end
	end

	

	// add inst tag to delayslot instruction
	// tag:
	//      is_delayslot 1
	//      branch_id	 6
	//

	// pipeline can contain 2^6 delayslot instruction
	reg                       delayslot;
	reg[`BRANCH_ID_BIT-1:0]   id_reg;

	always@(posedge clk) begin
		if(rst) begin
			id_reg <= 0;
			delayslot <= 1'b0;
		end
		else begin
		  if(nextu_ready & inst_valid) begin
		    if(is_branch & !branch_valid) begin
		        delayslot <= 1'b1;
		    end
			if(delayslot) begin
				id_reg <= id_reg + 1'b1;
				delayslot <= 1'b0;
			end
	      end
		end
	end

	assign branch_id   = id_reg;
	assign isdelayslot = delayslot;

endmodule