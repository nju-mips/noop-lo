`timescale 1ns / 1ps

module naive_to_sramlike(
    input clk,
    input reset,
    
    input wdata_en,
    input [31:0] wdata_addr,
    input [3:0] wdata_byte_en,
    input [31:0] wdata,
    output wdata_stall,
    
    input rdata_en,
    input [31:0] rdata_addr,
    output [31:0] rdata,
    output rdata_stall,

    output [31:0] addr,
    output [3:0] ben,
    output wr,
    input addr_ok,
    input data_ok,
    input [31:0] dout,
    output [31:0] din
    );
    
    assign addr = (rdata_en) ? rdata_addr : wdata_addr;
    assign din = wdata;
    assign rdata = dout;
    assign wdata_stall = wdata_en & (!data_ok);
    assign rdata_stall = rdata_en & (!data_ok);
    assign wr = wdata_en;
    
    reg [3:0] temp_en;
    reg idle;
    always @ (*) begin
        if(rdata_en)
            temp_en = 4'b1111;
        else if(wdata_en)
            temp_en = wdata_byte_en;
        else
            temp_en = 4'b0000;
    end
    always @ (posedge clk) begin
        if(reset) begin
            idle <= 1;
        end
        else if(( ( rdata_en | wdata_en ) & addr_ok ) & idle)
            idle <= 0;
        else if( (!idle) & data_ok )
            idle <= 1;
    end
    assign ben = idle ? temp_en : 4'b0000;
    
endmodule
