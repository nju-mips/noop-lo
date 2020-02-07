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

`define DE_SPECIAL_LEN		3
`define DE_SPECIAL_ERET 	3'b001
`define DE_SPECIAL_SYSCALL	3'b010
`define DE_SPECIAL_BREAK	3'b011
`define DE_SPECIAL_X		3'b000

`define A_SRC_X 		3'b000
`define A_SRC_RS		3'b001
`define A_SRC_SA		3'b010
`define A_SRC_HI		3'b011
`define A_SRC_LO		3'b100
`define A_SRC_CP0		3'b101
`define A_SRC_CP0_EPC	3'b110

`define B_SRC_REG		1'b0
`define B_SRC_IMM		1'b1
`define B_SRC_X			1'bx

`define EXT_TYPE_SIGN   1'b0
`define EXT_TYPE_ZERO   1'b1
`define EXT_TYPE_X      1'bx

`define RD_SEL_X		3'b000
`define RD_SEL_RD		3'b001
`define RD_SEL_RT		3'b010
`define RD_SEL_31		3'b011
`define RD_SEL_HI       3'b100
`define RD_SEL_LO       3'b101
`define RD_SEL_HILO     3'b110

`define FU_TYPE_X		3'b000
`define FU_TYPE_ALU		3'b001
`define FU_TYPE_LSU		3'b010
`define FU_TYPE_BRU		3'b011
`define FU_TYPE_MDU		3'b100

`define FU_OP_ALU_X 	5'b00000
`define FU_OP_ALU_ADD	5'b00001
`define FU_OP_ALU_LUI	5'b00010
`define FU_OP_ALU_SLT	5'b00011
`define FU_OP_ALU_SLTU	5'b00100
`define FU_OP_ALU_AND	5'b00101
`define FU_OP_ALU_OR	5'b00110
`define FU_OP_ALU_XOR	5'b00111
`define FU_OP_ALU_NOR	5'b01000
`define FU_OP_ALU_SUB	5'b01001
`define FU_OP_ALU_SLL	5'b01010
`define FU_OP_ALU_SRL	5'b01011
`define FU_OP_ALU_SRA	5'b01100
`define FU_OP_ALU_MOVN	5'b01101
`define FU_OP_ALU_MOVZ	5'b01110
`define FU_OP_ALU_MFC0	5'b01111
`define FU_OP_ALU_MTC0	5'b10000
`define FU_OP_ALU_ADD_OV 5'b10001
`define FU_OP_ALU_SUB_OV 5'b10011

`define FU_OP_LSU_X 	5'b00000
`define FU_OP_LSU_LB	5'b00001
`define FU_OP_LSU_LH	5'b00010
`define FU_OP_LSU_LWL	5'b00011
`define FU_OP_LSU_LW	5'b00100
`define FU_OP_LSU_LBU	5'b00101
`define FU_OP_LSU_LHU	5'b00110
`define FU_OP_LSU_LWR	5'b00111
`define FU_OP_LSU_SB	5'b01000
`define FU_OP_LSU_SH	5'b01001
`define FU_OP_LSU_SWL	5'b01010
`define FU_OP_LSU_SW	5'b01011
`define FU_OP_LSU_SWR	5'b01100

`define FU_OP_BRU_X		5'b00000
`define FU_OP_BRU_BEQ	5'b00001
`define FU_OP_BRU_BGEZ	5'b00010
`define FU_OP_BRU_BGTZ	5'b00011
`define FU_OP_BRU_BNE	5'b00100
`define FU_OP_BRU_BLTZ	5'b00101
`define FU_OP_BRU_BLEZ	5'b00110
`define FU_OP_BRU_J		5'b00111
`define FU_OP_BRU_JAL	5'b01000
`define FU_OP_BRU_JR	5'b01001
`define FU_OP_BRU_JALR	5'b01010
`define FU_OP_BRU_BGEZAL 5'b01011
`define FU_OP_BRU_BLTZAL 5'b01100
`define FU_OP_BRU_ERET  5'b01101

`define FU_OP_MDU_X		5'b00000
`define FU_OP_MDU_MUL	5'b00001
`define FU_OP_MDU_MULT	5'b00010
`define FU_OP_MDU_MULTU	5'b00011
`define FU_OP_MDU_DIV	5'b00100
`define FU_OP_MDU_DIVU	5'b00101
`define FU_OP_MDU_MFHI	5'b00110
`define FU_OP_MDU_MTHI	5'b00111
`define FU_OP_MDU_MFLO	5'b01000
`define FU_OP_MDU_MTLO	5'b01001

`define FU_OP_X			5'bxxxxx
