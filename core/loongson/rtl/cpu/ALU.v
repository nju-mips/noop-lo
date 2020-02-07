`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/11 15:07:40
// Design Name: 
// Module Name: alu_mips32
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


module ALU(
    input [31:0] a_in,b_in,
    input [3:0] alu_op,
    output reg [31:0]alu_out,
    output zero,less,overflow_out
   // output wire [31:0] zero_count
    );
    wire [2:0]alu_ctr;//¿ØÖÆÐÅºÅ
    wire [31:0] o_out;//ŒÓ·šÆ÷Êä³ö
    wire negative,carry,overflow;//ŒÓ·šÆ÷±êÖŸÎ»Êä³ö
    wire [31:0] zero_count;
    alu_controller controller( //ÒëÂë²úÉú¿ØÖÆÐÅºÅ
        .alu_op(alu_op),
        .alu_ctr(alu_ctr));
              
    adder adder_mips32(//ŒÓ·šÆ÷
        .cin(alu_op[0]),
        .a_in(a_in), 
        .b_in(b_in),
        .zero(zero), 
        .carry(carry),
        .overflow(overflow), 
        .negative(negative),
        .o_out(o_out));
        
    count_leading_zero leading_zero(
        .a_in(a_in),
        .op0(alu_op[0]),
        .result(zero_count)
        );  
    assign overflow_out = (alu_op[3:1] == 3'b111)?overflow:0;
    assign less = (alu_op[3:0] == 4'b0111)?(!carry):(overflow ^ negative);
    
    always @(*) 
    begin
        case(alu_ctr[2:0])
        3'b000:
        begin 
            if(a_in == 32'h0000_0000 || a_in == 32'hffff_ffff) begin
                alu_out <= 32'h20;
            end
            else begin
                alu_out <= zero_count;//Ç°µŒ0ºÍÇ°µŒ1
            end
        end
        3'b001:alu_out <= a_in ^ b_in; //Òì»ò
        3'b010:alu_out <= a_in | b_in; //»ò
        3'b011:alu_out <= ~(a_in | b_in);//»ò·Ç
        3'b100:alu_out <= a_in & b_in;//Óë
        3'b101:alu_out <= (less == 0)?32'b0:32'b1;
        3'b110://seb/seh
        begin
            if(alu_op[0] == 0)
                alu_out <= {{24{b_in[7]}},b_in[7:0]};
            else
                alu_out <= {{16{b_in[15]}},b_in[15:0]};
        end
        3'b111:alu_out <= o_out;//ŒÓŒõ·š
        endcase
    end
    
endmodule