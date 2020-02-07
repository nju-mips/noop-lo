`timescale 1ns / 1ps

`include "axi.vh"


module naive_axilite_bridge(
    input axi_clk,
    input axi_aresetn,
    
    input wdata_en,
    input [31:0] wdata_addr,
    input [3:0] wdata_byte_en,
    input [31:0] wdata,
    output wdata_stall,
    
    input rdata_en,
    input [31:0] rdata_addr,
    output [31:0] rdata,
    output rdata_stall,

    `axilite_master_if(axi)
    );

    // rdata, raddr
    reg [1:0] r_score_board;
    wire [1:0] r_shake;
    wire [1:0] r_status;

    // wresponse, wdata, waddr
    reg [2:0] w_score_board;
    wire [2:0] w_shake;
    wire [2:0] w_status;

    assign r_shake[0] = axi_arvalid & axi_arready;
    assign r_shake[1] = axi_rvalid & axi_rready;
    assign r_status = r_score_board | r_shake;
    always @ (posedge axi_clk) begin
        if( (axi_aresetn == 1'b0) || (r_status == 2'b11) )
            r_score_board <= 0;
        else
            r_score_board <= r_status;
    end

    assign w_shake[0] = axi_awvalid & axi_awready;
    assign w_shake[1] = axi_wvalid & axi_wready;
    assign w_shake[2] = axi_bvalid & axi_bready;
    assign w_status = w_score_board | w_shake;
    always @ (posedge axi_clk) begin
         if( (axi_aresetn == 1'b0) || (w_status == 3'b111) )
             w_score_board <= 0;
         else
             w_score_board <= w_status;
    end

    assign axi_araddr = rdata_addr;
    assign axi_arvalid = rdata_en & (~r_score_board[0]);
    assign axi_awaddr = wdata_addr;
    assign axi_awvalid = wdata_en & (~w_score_board[0]);
    assign axi_bready = wdata_en & (~w_score_board[2]);
    assign rdata = axi_rdata;
    assign axi_rready = rdata_en & (~r_score_board[1]);
    assign axi_wdata = wdata;
    assign axi_wvalid = wdata_en & (~w_score_board[1]);
    assign axi_wstrb = wdata_byte_en;
    assign axi_awprot = 3'd0;
    assign axi_arprot = 3'd0;

    assign rdata_stall = (rdata_en == 1'b1) && (r_status != 2'b11) && (axi_aresetn == 1'b1);
    assign wdata_stall = (wdata_en == 1'b1) && (w_status != 3'b111) && (axi_aresetn == 1'b1);

endmodule
