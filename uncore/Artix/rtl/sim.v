`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/23 15:15:17
// Design Name: 
// Module Name: test_old_loongson
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


module test_top();

    reg clk;
    reg reset;
    
    fpga_top fpga_top_i(
    .resetn(reset), 
    .clk(clk),

    //------gpio-------
    .led(),
    .led_rg0(),
    .led_rg1(),
    .num_csn(),
    .num_a_g(),
    .switch(8'd0), 
    .btn_key_col(),
    .btn_key_row(),
    .btn_step(2'd0)
    );
    
    initial
    clk = 0;
    
    always
    #5 clk = ~clk;

    initial begin
    reset = 0;
    #16 reset=1;
    end

endmodule
