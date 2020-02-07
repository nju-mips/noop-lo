`timescale 1ns / 1ps

`define OPCODE_SPECIAL  6'b000000
`define OPCODE_SPECIAL2 6'b011100
`define OPCODE_REGIMM   6'b000001
`define OPCODE_COP0     6'b010000

`define INSTR_TYPE_COMMON   3'b000
`define INSTR_TYPE_SPECIAL  3'b001
`define INSTR_TYPE_SPECIAL2 3'b010
`define INSTR_TYPE_REGIMM   3'b011
`define INSTR_TYPE_COP0	    3'b100
`define INSTR_TYPE_INVALID  3'b111

module bpu(
    input clk,
    input reset,
    
    input [31:0] id_instr,
    input [31:0] id_pc,
    input [31:0] id_pc_4,
    
    input mem_pc_branch,
    input [31:0] mem_pc,
    input mem_branch_state,
    
    output bp_result,
    output [31:0] bp_addr
);

    // decode
	wire[5:0] opcode = id_instr[31:26];
	wire[4:0] rt = id_instr[20:16];
	wire[5:0] func = id_instr[5:0];

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

    wire [7:0] branch_type;
    assign branch_type[0] = (lookup_idx == /* BGEZAL*/  {`INSTR_TYPE_REGIMM, 6'b010001});
    assign branch_type[1] = (lookup_idx == /* BLTZAL*/  {`INSTR_TYPE_REGIMM, 6'b010000});
    assign branch_type[2] = (lookup_idx == /* BEQ   */  {`INSTR_TYPE_COMMON, 6'b000100});
    assign branch_type[3] = (lookup_idx == /* BGEZ  */  {`INSTR_TYPE_REGIMM, 6'b000001});
    assign branch_type[4] = (lookup_idx == /* BGTZ  */  {`INSTR_TYPE_COMMON, 6'b000111});
    assign branch_type[5] = (lookup_idx == /* BLEZ  */  {`INSTR_TYPE_COMMON, 6'b000110});
    assign branch_type[6] = (lookup_idx == /* BLTZ  */  {`INSTR_TYPE_REGIMM, 6'b000000});
    assign branch_type[7] = (lookup_idx == /* BNE   */  {`INSTR_TYPE_COMMON, 6'b000101});
    
    reg [1:0] counter [63:0];
    wire [5:0] r_index = id_pc[7:2];
    wire [5:0] w_index = mem_pc[7:2];
    wire [1:0] r_counter;
    wire [1:0] w_counter;
    reg [1:0] p_change;
    reg [1:0] n_change;
    
    assign r_counter = counter[r_index];
    assign w_counter = counter[w_index];
    always @ (*) begin
        case(w_counter)
        0: p_change = 2'b00;
        1: p_change = 2'b11;
        2: p_change = 2'b01;
        3: p_change = 2'b00;
        endcase
    end
    always @ (*) begin
        case(w_counter)
        0: n_change = 2'b01;
        1: n_change = 2'b01;
        2: n_change = 2'b11;
        3: n_change = 2'b11;
        endcase
    end
    
    integer i;
    always @ (posedge clk) begin
        if(reset) begin
            for(i=0; i<64; i=i+1)
                counter[i] = 0;
        end
        else if(mem_pc_branch) begin
            if( w_counter[1]==mem_branch_state ) begin
                counter[w_index] <= w_counter + p_change;
            end
            else begin
                counter[w_index] <= w_counter + n_change;
            end
        end
    end
    
    assign bp_result = (|branch_type) & (r_counter[1]);
    assign bp_addr = id_pc_4 + { {14{id_instr[15]}}, id_instr[15:0] , 2'd0};

endmodule

module mem_pc_branch_unit(
    input [2:0] exmem_condition,
    output mem_pc_branch
    );

    wire [5:0] is_branch;
    
    assign is_branch[0] = exmem_condition == 3'b001;
    assign is_branch[1] = exmem_condition == 3'b010;
    assign is_branch[2] = exmem_condition == 3'b011;
    assign is_branch[3] = exmem_condition == 3'b100;
    assign is_branch[4] = exmem_condition == 3'b101;
    assign is_branch[5] = exmem_condition == 3'b110;
    
    assign mem_pc_branch = (|is_branch);

endmodule