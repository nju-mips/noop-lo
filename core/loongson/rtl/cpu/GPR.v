`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/04 13:22:38
// Design Name: 
// Module Name: register_mips32
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


module GPR
#(parameter DATA_WIDTH = 32,parameter ADDR_WIDTH = 5)
(
    input [(ADDR_WIDTH-1):0] rs_addr,rt_addr,rd_addr,
    input [(DATA_WIDTH-1):0] rd_in,
    input [3:0] rd_byte_w_en,
    input clk,
    input reset,
    input write,
    output reg [(DATA_WIDTH-1):0] rs_out,rt_out);
    //Declare the register group variable
    reg [(DATA_WIDTH-1):0] register [2**ADDR_WIDTH-1:0]; //registers
    integer i; 
    initial begin
        for(i = 0; i < 32; i = i + 1)
            register[i] = 0;
    end   
    always@(posedge clk) begin//write
        if(reset)
        begin
            for(i = 0; i < 32; i = i + 1)
                register[i] = 0;
        end
        else
        begin
            if(rd_addr != 0 && write)
            begin
                if(rd_byte_w_en[3] == 1) register [rd_addr] [31:24] <= rd_in[31:24];
                if(rd_byte_w_en[2] == 1) register [rd_addr] [23:16] <= rd_in[23:16];
                if(rd_byte_w_en[1] == 1) register [rd_addr] [15:8] <= rd_in[15:8];
                if(rd_byte_w_en[0] == 1) register [rd_addr] [7:0] <= rd_in[7:0];
            end
        end  
    end
    // Read
    always @ (*) begin
        if(rd_addr == rs_addr)begin
            rs_out[7:0] = (rd_byte_w_en[0])?rd_in[7:0]:register[rs_addr][7:0];
            rs_out[15:8] = (rd_byte_w_en[1])?rd_in[15:8]:register[rs_addr][15:8];
            rs_out[23:16] = (rd_byte_w_en[2])?rd_in[23:16]:register[rs_addr][23:16];
            rs_out[31:24] = (rd_byte_w_en[3])?rd_in[31:24]:register[rs_addr][31:24];
        end
        else
            rs_out = register[rs_addr];
    end
    always @ (*) begin
        if(rd_addr == rt_addr)begin
            rt_out[7:0] = (rd_byte_w_en[0])?rd_in[7:0]:register[rt_addr][7:0];
            rt_out[15:8] = (rd_byte_w_en[1])?rd_in[15:8]:register[rt_addr][15:8];
            rt_out[23:16] = (rd_byte_w_en[2])?rd_in[23:16]:register[rt_addr][23:16];
            rt_out[31:24] = (rd_byte_w_en[3])?rd_in[31:24]:register[rt_addr][31:24];
        end
        else
            rt_out = register[rt_addr];
    end    
    
endmodule