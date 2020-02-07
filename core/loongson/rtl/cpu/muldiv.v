`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2016 02:10:11 PM
// Design Name: 
// Module Name: muldiv
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


module muldiv
(
    input [3:0] Md_op,
    input [31:0] Rs_in,
    input [31:0] Rt_in,
    input Clk,
    input reset,
    input enable_i,

    output reg [31:0] Res_out,
    output Md_stall
);

// Md_op = 0001 op = DIV
//     0010 op = DIVU
//     0011 op = MFHI 
//     0100 op = MFLO
//     0101 op = MTHI
//     0110 op = MTLO
//     0111 op = MUL
//     1000 op = MULT
//     1001 op = MULTU

reg [31:0] Hi;
reg [31:0] Lo;

wire [127:0] mul_res, div_res;
wire div_valid;
reg [31:0] temp_out;

reg [63:0] A;
wire [63:0] tempA;
reg [63:0] B;
wire [63:0] tempB;
reg data_valid;

wire needstall = (Md_op == 4'b0111) || (Md_op == 4'b1000) || (Md_op == 4'b1001) || (Md_op == 4'b0001) || (Md_op == 4'b0010);
reg stall;

assign Md_stall = needstall && stall;


parameter mult_pipestages = 2;
parameter mult_pipestages_plus_one = 3;
parameter status_bit = 3;
mult_gen_0 mul0 (
  .CLK(Clk),  // input wire CLK
  .A(A),      // input wire [31 : 0] A
  .B(B),      // input wire [31 : 0] B
  .CE(enable_i),
  .SCLR(reset),
  .P(mul_res)      // output wire [63 : 0] P
);


div_gen_0 div0 (
  .aclk(Clk),                                      // input wire aclk
  .s_axis_divisor_tvalid(data_valid),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tdata(B),      // input wire [31 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(data_valid),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tdata(A),    // input wire [31 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(div_valid),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(div_res)            // output wire [63 : 0] m_axis_dout_tdata
);


assign tempA = Rs_in[31] ? {32'hffffffff, Rs_in} : {32'h0, Rs_in};
assign tempB = Rt_in[31] ? {32'hffffffff, Rt_in} : {32'h0, Rt_in};
always @ (*) begin
    case (Md_op)
        1 : begin //div
            A = Rs_in[31] ? ~tempA + 1 : tempA;
            B = Rt_in[31] ? ~tempB + 1 : tempB;
            Res_out = 0;
        end
        2 : begin //divu
            A = {32'h0, Rs_in};
            B = {32'h0, Rt_in};
            Res_out = 0;
        end
        3 : begin //mfhi
            A = {32'h0, Rs_in};
            B = {32'h0, Rt_in};
            Res_out = Hi;
        end
        4 : begin //mflo
            A = {32'h0, Rs_in};
            B = {32'h0, Rt_in};
            Res_out = Lo;
        end
        5 : begin //mthi
            A = {32'h0, Rs_in};
            B = {32'h0, Rt_in};
            Res_out = 0;
        end
        6 : begin //mtlo
            A = {32'h0, Rs_in};
            B = {32'h0, Rt_in};
            Res_out = 0;
        end
        7 : begin //mul
            A = Rs_in[31] ? {32'hffffffff, Rs_in} : {32'h0, Rs_in};
            B = Rt_in[31] ? {32'hffffffff, Rt_in} : {32'h0, Rt_in};
            Res_out = temp_out;       
        end
        8 : begin //mult
            A = Rs_in[31] ? {32'hffffffff, Rs_in} : {32'h0, Rs_in};
            B = Rt_in[31] ? {32'hffffffff, Rt_in} : {32'h0, Rt_in};
            Res_out = 0;
        end
        9 : begin //multu
            A = {32'h0, Rs_in};
            B = {32'h0, Rt_in};
            Res_out = 0;
        end
        default : begin
            A = {32'h0, Rs_in};
            B = {32'h0, Rt_in};
            Res_out = 0;
        end     
    endcase
end

reg [status_bit-1:0] status;
always @ (posedge Clk) begin
    if( reset==1'b1 ) begin
        stall <= 1;
        status <= 0;
        temp_out <= 0;
        data_valid <= 0;
    end
    else if(enable_i == 1'b1) begin
    case (Md_op)
        1 : begin //div
                case(status)
                0:begin
                    stall <= 1'b1;
                    data_valid <= 1'b1;
                    status <= 1;
                end
                1:begin
                    data_valid <= 1'b0;
                    status <= 2;
                end
                2:begin
                    if(div_valid) begin
                        Hi <= Rs_in[31] ? ~div_res[31:0] + 1 : div_res[31:0];
                        Lo <= ((Rs_in[31] & ~Rt_in[31])|(~Rs_in[31] & Rt_in[31])) ? ~div_res[95:64] + 1 : div_res[95:64];
                        stall <= 1'b0;
                        status <= 3;
                    end
                end
                3:begin
                    stall <= 1'b1;
                    status <= 0;
                end
                endcase
        end
        2 : begin //divu
                case(status)
                0:begin
                    stall <= 1'b1;
                    data_valid <= 1'b1;
                    status <= 1;
                end
                1:begin
                    data_valid <= 1'b0;
                    status <= 2;
                end
                2:begin
                    if(div_valid) begin
                        Hi <= div_res[31:0];
                        Lo <= div_res[95:64];
                        stall <= 1'b0;
                        status <= 3;
                    end
                end
                3:begin
                    stall <= 1'b1;
                    status <= 0;
                end
                endcase
        end
        3 : begin //mfhi
            stall <= 1;
            status <= 0;
        end
        4 : begin //mflo
            stall <= 1;
            status <= 0;
        end
        5 : begin //mthi
            stall <= 1;
            status <= 0;
            Hi <= Rs_in;
        end
        6 : begin //mtlo
            stall <= 1;
            status <= 0;
            Lo <= Rs_in;
        end
        7 : begin //mul
                case(status)
                0:begin
                    stall <= 1;
                    status <= 1;
                end
                mult_pipestages:begin
                    {Hi, temp_out} <= mul_res[63:0];
                    stall <= 0;
                    status <= mult_pipestages_plus_one;
                end
                mult_pipestages_plus_one:begin
                    stall <= 1;
                    status <= 0;
                end
                default:begin
                    stall <= 1;
                    status <= status + 1'b1;
                end
                endcase
        end
        8 : begin //mult
                case(status)
                0:begin
                    stall <= 1;
                    status <= 1;
                end
                mult_pipestages:begin
                    {Hi, Lo} <= mul_res[63:0];
                    stall <= 0;
                    status <= mult_pipestages_plus_one;
                end
                mult_pipestages_plus_one:begin
                    stall <= 1;
                    status <= 0;
                end
                default:begin
                    stall <= 1;
                    status <= status + 1'b1;
                end
                endcase
        end
        9 : begin //multu
                case(status)
                0:begin
                    stall <= 1;
                    status <= 1;
                end
                mult_pipestages:begin
                    {Hi, Lo} <= mul_res[63:0];
                    stall <= 0;
                    status <= mult_pipestages_plus_one;
                end
                mult_pipestages_plus_one:begin
                    stall <= 1;
                    status <= 0;
                end
                default:begin
                    stall <= 1;
                    status <= status + 1'b1;
                end
                endcase
        end
        default : begin
            stall <= 1;
            status <= 0;
            temp_out <= 0;
            data_valid <= 1'b0;
        end     
    endcase
    end
end


endmodule
