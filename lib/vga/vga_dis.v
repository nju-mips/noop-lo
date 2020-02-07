`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NJU
// Engineer: dhr
// 
// Create Date: 2017/02/10 10:03:40
// Design Name: 
// Module Name: vga_dis
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


module vga_dis # (
    parameter     h_frontporch = 56-1,
    parameter     h_active = 56+120-1,
    parameter     h_backporch = 56+120+800-1,
    parameter     h_total = 56+120+800+64-1,

    parameter     v_frontporch = 37-1,
    parameter     v_active = 37+6-1,
    parameter     v_backporch = 37+6+600-1,
    parameter     v_total = 37+6+600+23-1,

	parameter     screen_length = 320,
    parameter     screen_width = 200,
	
    parameter     X_WIDTH = 11,
    parameter     Y_WIDTH = 11,

    parameter     VMEM_ADDR_WIDTH = 20 )
    (
    input                            pclk,
    input                            reset,

	input      [11:0]                vga_data,
	
	output reg [VMEM_ADDR_WIDTH-1:0] vmem_image_r_addr,
	
	output reg [VMEM_ADDR_WIDTH-1:0] vmem_text_r_addr,
    output     [X_WIDTH-1:0]         h_cnt,
    output     [Y_WIDTH-1:0]         v_cnt,

    output                           hsync,
    output                           vsync,
	output     reg [3:0]                 vga_r,
    output     reg [3:0]                 vga_g,
    output     reg [3:0]                 vga_b
    );

    localparam max_pixel_addr = screen_length*screen_width-1;
	localparam h_limit = h_active + screen_length;
	localparam v_limit = v_active + screen_width;

    reg   [X_WIDTH-1:0]    x_cnt;
    reg   [Y_WIDTH-1:0]    y_cnt;

	reg [VMEM_ADDR_WIDTH-1:0] cur_pixel_addr;
	reg [VMEM_ADDR_WIDTH-1:0] cur_text_addr;

    wire         h_valid;
    wire         h_800_valid;
    wire         v_valid;
    wire         v_600_valid;
    wire         valid;
    wire         valid_800x600;

    always @(posedge pclk)
        if (reset == 1'b1)
            x_cnt <= 0;
        else begin
            if (x_cnt == h_total)
                x_cnt <= 0;
            else
                x_cnt <= x_cnt + 1;
        end

    always @(posedge pclk)
        if (reset == 1'b1)
            y_cnt <= 0;
        else begin
            if ((y_cnt == v_total) & (x_cnt == h_total))
                y_cnt <= 0;
            else if (x_cnt == h_total)
                y_cnt <= y_cnt + 1;
        end

    assign hsync = ((x_cnt > h_frontporch)) ? 1'b1 : 1'b0;
    assign vsync = ((y_cnt > v_frontporch)) ? 1'b1 : 1'b0;

    assign h_valid = ((x_cnt > h_active) & (x_cnt <= h_limit)) ? 1'b1 : 1'b0;
    assign v_valid = ((y_cnt > v_active) & (y_cnt <= v_limit)) ? 1'b1 : 1'b0;

    assign valid = (h_valid & v_valid) ? 1'b1 : 1'b0;

	assign h_cnt = (h_valid) ? x_cnt - h_active - 1'b1 : {X_WIDTH{1'b0}};
    assign v_cnt = (v_valid) ? y_cnt - v_active - 1'b1 : {Y_WIDTH{1'b0}};


    //vmem_image_r_addr is prefetch pixel addr
	always @ (posedge pclk) begin
	    if(reset == 1'b1)
		    cur_pixel_addr <= 0;
		else if(cur_pixel_addr == max_pixel_addr)
		    cur_pixel_addr <= 0;
		else if(valid)
		    cur_pixel_addr <= cur_pixel_addr + 1;
		else
		    cur_pixel_addr <= cur_pixel_addr;
	end
	always @ (*) begin
	    if(cur_pixel_addr == max_pixel_addr)
		    vmem_image_r_addr = 0;
		else if(valid)
		    vmem_image_r_addr = cur_pixel_addr + 1;
		else
		    vmem_image_r_addr = cur_pixel_addr;
	end

    localparam h_expand_limit = h_active + screen_length*2;
    localparam v_expand_limit = v_active + screen_width*2;
    localparam h_expand_text_num = screen_length;
    wire h_expand_valid = ((x_cnt > h_active) & (x_cnt <= h_expand_limit)) ? 1'b1 : 1'b0;
    wire v_expand_valid = ((y_cnt > v_active) & (y_cnt <= v_expand_limit)) ? 1'b1 : 1'b0;
    wire expand_valid = (h_expand_valid & v_expand_valid) ? 1'b1 : 1'b0;
    wire [X_WIDTH-1:0] h_expand_cnt = (h_expand_valid) ? x_cnt - h_active - 1'b1 : {X_WIDTH{1'b0}};
    wire [Y_WIDTH-1:0] v_expand_cnt = (v_expand_valid) ? y_cnt - v_active - 1'b1 : {Y_WIDTH{1'b0}};
    //vmem_text_r_addr is prefetch text addr
    always @ (posedge pclk) begin
        if(reset == 1'b1)
            cur_text_addr <= 0;
        else if((x_cnt == h_expand_limit) && (y_cnt == v_expand_limit))
            cur_text_addr <= 0;
        else if(h_expand_cnt[0] == 1'b1) begin
            if(x_cnt != h_expand_limit)
                cur_text_addr <= cur_text_addr + 1'b1;
            else begin
                if(v_expand_cnt[0] == 1'b1)
                    cur_text_addr <= cur_text_addr + 1'b1;
                else
                    cur_text_addr <= cur_text_addr + 1'b1 - h_expand_text_num;
            end
        end
    end
    always @ (*) begin
        if(expand_valid == 1'b0)
            vmem_text_r_addr = cur_text_addr;
        else if((x_cnt > h_active) && (x_cnt <= (h_expand_limit-1)) && (h_expand_cnt[0]==1'b0))
            vmem_text_r_addr = cur_text_addr;
        else if((x_cnt > (h_expand_limit-1)) && (v_expand_cnt[0]==1'b0))
            vmem_text_r_addr = cur_text_addr + 1 - h_expand_text_num;
        else if((x_cnt > (h_expand_limit-1)) && (y_cnt == v_expand_limit))
            vmem_text_r_addr = 0;
        else
            vmem_text_r_addr = cur_text_addr + 1'b1;
    end

    assign h_800_valid = ((x_cnt > h_active) & (x_cnt <= h_backporch)) ? 1'b1 : 1'b0;
    assign v_600_valid = ((y_cnt > v_active) & (y_cnt <= v_backporch)) ? 1'b1 : 1'b0;
    assign valid_800x600 = (h_800_valid & v_600_valid) ? 1'b1 : 1'b0;
    always @ (*)
        if(expand_valid) begin
            vga_r = vga_data[11:8];
            vga_g = vga_data[7:4];
            vga_b = vga_data[3:0];
        end
        else if(valid_800x600) begin
            vga_r = 4'hf;
            vga_g = 4'hf;
            vga_b = 4'hf;
        end
        else begin
            vga_r = 4'd0;
            vga_g = 4'd0;
            vga_b = 4'd0;
        end

endmodule
