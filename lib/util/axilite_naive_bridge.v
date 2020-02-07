`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NJU
// Engineer: DHR
// 
// Create Date: 2017/03/24 12:14:46
// Design Name: 
// Module Name: uart
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

//posedge axiclk , axi reset is active low
module axilite_naive_bridge(
    input axi_clk,
    input axi_resetn,

	input [31:0] axi_awaddr,
	input [0:0] axi_awvalid,
	output reg [0:0] axi_awready,
	input [31:0] axi_wdata,
	input [3:0] axi_wstrb,
	input [0:0] axi_wvalid,
	output reg [0:0] axi_wready,
	output [1:0] axi_bresp,
	output reg [0:0] axi_bvalid,
	input [0:0] axi_bready,
	input [31:0] axi_araddr,
	input [0:0] axi_arvalid,
	output [0:0] axi_arready,
	output [31:0] axi_rdata,
	output [1:0] axi_rresp,
	output [0:0] axi_rvalid,
	input [0:0] axi_rready,

    output reg wdata_en,
    output reg [31:0] wdata_addr,
    output reg [31:0] wdata,
    output reg [3:0] wdata_byte_en
    );

    assign axi_arready = 1'b0;
    assign axi_rdata = 32'd0;
    assign axi_rresp = 2'b0;
    assign axi_rvalid = 1'b0;
    assign axi_bresp = 2'd0;

    reg [1:0] status;
    always @ (posedge axi_clk) begin
        if( axi_resetn == 1'b0 ) begin
            axi_awready <= 1'b0;
            axi_wready <= 1'b0;
            axi_bvalid <= 1'b0;
            status <= 0;
            wdata_en <= 1'b0;
        end
        else begin
            case(status)
            2'd0:   begin
                if( axi_awvalid & axi_wvalid ) begin
                    axi_awready <= 1'b1;
                    axi_wready <= 1'b1;
                    wdata <= axi_wdata;
                    wdata_addr <= axi_awaddr;
                    wdata_en <= 1'b1;
                    wdata_byte_en <= axi_wstrb;
                    status <= 2'd1;
                end
            end
            2'd1:   begin
                axi_awready <= 1'b0;
                axi_wready <= 1'b0;
                wdata_en <= 1'b0;
                axi_bvalid <= 1'b1;
                status <= 2'd2;
            end
            2'd2:   begin
                if(axi_bready) begin
                    axi_bvalid <= 1'b0;
                    status <= 2'd0;
                end
            end
            default:    status <= 2'd0;
            endcase
        end
    end

endmodule
