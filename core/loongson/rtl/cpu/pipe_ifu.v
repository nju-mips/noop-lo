`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NJU
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name:
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

`define FIFO_SIZE 4
`define INDEX_LEN 2
`define INDEX_LEN_1 1

module pipe_ifu(
    //common signal
    input clk,
	input reset,
        
    //memory interface
    output  [ 3:0]  inst_sram_cen,
    output  [31:0]  inst_sram_wdata,
    input   [31:0]  inst_sram_rdata,
    output          inst_sram_wr,
    output [31:0]  inst_sram_addr,
    input           inst_sram_addr_ok,
    input           inst_sram_data_ok,

    //cpu inner signal
    input [31:0] cur_pc,
    output if_stall,
    input ex_stall,
    input mem_stall,
    output [31:0] cur_instr
    );

    assign inst_sram_wr = 0;
    assign inst_sram_wdata = 0;

    //是否从存储器或队列中得到了cur_pc对应的指仿
    wire instr_hit;
    //是否取错指令，需要冲刷指令队列和地址队列
    wire fetch_error;
    //多发出的取指请求
    reg [31:0] dup_req;
    //是否处于可以接收指令的状怿
    wire instr_accept;
    //是否来了丿条可用指仿
    wire instr_coming;
    
    //指令是否将被取走
    wire leave_instr = instr_hit & (!ex_stall) & (!mem_stall);
    
    //指令队列和地�?队列公用的读指针
    reg [`INDEX_LEN-1:0] r_index;
    
    //指令队列
    reg [`INDEX_LEN-1:0] instr_w_index;
    reg [31:0] instr_fifo [`FIFO_SIZE-1:0];
    wire instr_fifo_empty = (r_index == instr_w_index);
    wire instr_fifo_full  = (r_index == (instr_w_index + {{`INDEX_LEN_1{1'b0}}, 1'b1}));
    
    //地址队列
    reg [`INDEX_LEN-1:0] addr_w_index;
    reg [31:0] addr_fifo [`FIFO_SIZE-1:0];
    wire addr_fifo_empty = (r_index == addr_w_index);
    wire addr_fifo_full  = (r_index == (addr_w_index + {{`INDEX_LEN_1{1'b0}}, 1'b1}));
    
    assign instr_coming = instr_accept & inst_sram_data_ok;
    assign instr_hit = (instr_fifo_empty == 1'b0) && (cur_pc == addr_fifo[r_index]);
    assign cur_instr = instr_fifo[r_index];

    assign fetch_error = (addr_fifo_empty == 1'b0) && (cur_pc != addr_fifo[r_index]);
    wire [31:0] index_diff;
    dis_unit dis_0(
    .a(addr_w_index),
    .b(instr_w_index),
    .dis_val(index_diff)
    );
    always @ (posedge clk) begin
        if(reset) begin
            dup_req <= 0;
        end
        else if((fetch_error == 1'b1) && (addr_w_index != instr_w_index)) begin
            if(inst_sram_data_ok)
                dup_req <= index_diff - 1;
            else
                dup_req <= index_diff;
        end
        else if((dup_req != 0) && (inst_sram_data_ok == 1'b1))
            dup_req <= dup_req - 1'b1;
        else
            dup_req <= dup_req;
    end
    reg [31:0] real_dup_req;
    always @ (*) begin
        if((fetch_error == 1'b1) && (addr_w_index != instr_w_index)) begin
                real_dup_req = index_diff;
        end
        else
            real_dup_req = dup_req;
    end
    assign instr_accept = (real_dup_req == 0) ? 1'b1 : 1'b0;
    
    
    always @ (posedge clk) begin
        if(reset) begin
            r_index <= 0;
        end
        //取走�?条指�?
        else if(leave_instr) begin
            r_index <= r_index + 1;
        end
        else
            r_index <= r_index;
    end
    
    always @ (posedge clk) begin
        if(reset) begin
            instr_w_index <= 0;
        end
        //有一条指令到来，为了与addr_fifo同步，所以必须移动指针
        else if(instr_coming) begin
            if(fetch_error) begin
                instr_w_index <= r_index + 1;
                instr_fifo[r_index] <= inst_sram_rdata;
            end
            else begin
                instr_w_index <= instr_w_index + 1;
                instr_fifo[instr_w_index] <= inst_sram_rdata;
            end
        end
        //冲刷队列
        else if(fetch_error) begin
            instr_w_index <= r_index;
        end
    end
    
    //送出了一个访存地�?
    reg [31:0] prefetch_pc;
    assign inst_sram_addr = fetch_error ? cur_pc : prefetch_pc;
    wire addr_shake = inst_sram_addr_ok & (&inst_sram_cen);
    always @ (posedge clk) begin
        if(reset) begin
            addr_w_index <= 0;
            prefetch_pc <= cur_pc;
        end
        else if(addr_shake) begin
            if(fetch_error) begin
                addr_w_index <= r_index + 1;
                addr_fifo[r_index] <= cur_pc;
                prefetch_pc <= cur_pc + 4;
            end
            else begin
                addr_w_index <= addr_w_index + 1;
                addr_fifo[addr_w_index] <= prefetch_pc;
                prefetch_pc <= prefetch_pc + 4;
            end
        end
        else if(fetch_error) begin
            addr_w_index <= r_index;
            prefetch_pc <= cur_pc;
        end
    end

    assign if_stall = !instr_hit;
    assign inst_sram_cen = (addr_fifo_full & (!fetch_error) ) ? 4'b0000 : 4'b1111; 

endmodule

module dis_unit(
    input [`INDEX_LEN-1:0] a,
    input [`INDEX_LEN-1:0] b,
    output [31:0] dis_val
    );
    
    localparam pad = 32 - `INDEX_LEN;
    assign dis_val = { {pad{1'b0}}, a-b };
    
endmodule
