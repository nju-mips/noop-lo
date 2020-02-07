/*------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Copyright (c) 2016, Loongson Technology Corporation Limited.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this 
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3. Neither the name of Loongson Technology Corporation Limited nor the names of 
its contributors may be used to endorse or promote products derived from this 
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL LOONGSON TECHNOLOGY CORPORATION LIMITED BE LIABLE
TO ANY PARTY FOR DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------*/
`define INST_SRAM_MASK     32'h0000_0000
`define INST_SRAM_WINDOW   32'hffff_ffff
`define DATA_SRAM_MASK     32'h0000_0000
`define DATA_SRAM_WINDOW   32'hffff_ffff

module sramlike_to_ahb(
    //fetch like-sram interface
    input  [ 3:0]  if_ben,
    input  [31:0]  if_wdata,
    input          if_wr,
    input  [31:0]  if_addr,
    output         if_addr_ok,
    output         if_data_ok,
    output [31:0]  if_rdata,

    //mem like-sram interface
    input  [ 3:0]  mem_ben,
    input  [31:0]  mem_wdata,
    input          mem_wr,
    input  [31:0]  mem_addr,
    output         mem_addr_ok,
    output         mem_data_ok,
    output [31:0]  mem_rdata,

    //ahb-lite interface
    input hclk,
    input hresetn,
    
    output [1 :0] htrans,
    output [2 :0] hsize,
    output [31:0] haddr,
    output        hwrite,
    output [31:0] hwdata,
    output [2 :0] hburst,
    output        hmastlock,
    output [3 :0] hprot,

    input  [31:0] hrdata,
    input         hreadyout,
    input         hresp,

    //inst sram
    output        inst_cen,
    output [3 :0] inst_wen,
    output [31:0] inst_addr,
    output [31:0] inst_din,
    input  [31:0] inst_dout,
    //data sram
    output        data_cen,
    output [3 :0] data_wen,
    output [31:0] data_addr,
    output [31:0] data_din,
    input  [31:0] data_dout

);

//fetch or mem transfer
wire if_valid;
wire mem_valid;
assign if_valid  = |if_ben;
assign mem_valid = |mem_ben;

//sel
wire if_sel_i_sram;
wire if_sel_d_sram;
wire if_sel_ahb;
wire mem_sel_i_sram;
wire mem_sel_d_sram;
wire mem_sel_ahb;
assign if_sel_i_sram  = (if_addr & `INST_SRAM_MASK) == `INST_SRAM_WINDOW;
assign if_sel_d_sram  = (if_addr & `DATA_SRAM_MASK) == `DATA_SRAM_WINDOW;
assign if_sel_ahb     = !if_sel_i_sram && !if_sel_d_sram;
assign mem_sel_i_sram = (mem_addr & `INST_SRAM_MASK) == `INST_SRAM_WINDOW;
assign mem_sel_d_sram = (mem_addr & `DATA_SRAM_MASK) == `DATA_SRAM_WINDOW;
assign mem_sel_ahb    = !mem_sel_i_sram && !mem_sel_d_sram;

//sel&valid
wire if_i_sram_valid  = if_sel_i_sram  && if_valid;
wire if_d_sram_valid  = if_sel_d_sram  && if_valid;
wire if_ahb_valid     = if_sel_ahb     && if_valid;
wire mem_i_sram_valid = mem_sel_i_sram && mem_valid;
wire mem_d_sram_valid = mem_sel_d_sram && mem_valid;
wire mem_ahb_valid    = mem_sel_ahb    && mem_valid;

//------------------------{inst sram}begin----------------------------//
assign inst_cen        = if_i_sram_valid && if_addr_ok || mem_i_sram_valid && mem_addr_ok;
assign inst_wen        = {4{mem_i_sram_valid & mem_wr}} & mem_ben;
assign inst_addr[31:2] = mem_i_sram_valid ? mem_addr[31:2] : if_addr[31:2];
assign inst_addr[1 :0] = 2'b00;
assign inst_din        = mem_wdata;
//inst_dout
//-------------------------{inst sram}end-----------------------------//

//------------------------{data sram}begin----------------------------//
assign data_cen        = if_d_sram_valid && if_addr_ok || mem_d_sram_valid && mem_addr_ok;
assign data_wen        = {4{mem_d_sram_valid & mem_wr}} & mem_ben;
assign data_addr[31:2] = mem_d_sram_valid ? mem_addr[31:2] : if_addr[31:2];
assign data_addr[1 :0] = 2'b00;
assign data_din        = mem_wdata;
//data_dout
//-------------------------{data sram}end-----------------------------//

//------------------------{ahb-lite}begin-----------------------------//
//mem 3 bytes
reg mem_3bytes;
reg [31:0] mem_3bytes_addr;
reg [1 :0] mem_3bytes_size;
reg        mem_3bytes_write;
always @(posedge hclk)
begin
    if(!hresetn)
    begin
        mem_3bytes <= 1'b0;
    end
    else if( (mem_ben==4'b0111||mem_ben==4'b1110) && hreadyout)
    begin
        mem_3bytes <= 1'b1;
        mem_3bytes_addr  <= {mem_addr[31:1],1'b0};
        mem_3bytes_size  <= mem_ben[0] ? 2'd0 : 2'd1;
        mem_3bytes_write <= mem_wr;
    end
    else if (hreadyout)
    begin
        mem_3bytes <= 1'b0;
    end
end
//size 
wire [1:0] if_size;
wire [1:0] mem_size;
assign if_size  = 2'd2 ;
assign mem_size = (mem_ben==4'b1111) ? 2'd2 :
                  (mem_ben[1:0]==2'b11) || (mem_ben==4'b1100) ? 2'd1 : 2'd0;

//write data
reg [31:0] ahb_wdata;
always @(posedge hclk)
begin
    if(!hresetn)
    begin
        ahb_wdata <= 32'd0;
    end
    else if (!mem_3bytes && mem_ahb_valid && hreadyout)
    begin
        ahb_wdata <= mem_wdata;
    end
end
//interface
assign htrans    = (mem_3bytes || if_ahb_valid || mem_ahb_valid)? 2'b10 : 2'b00;  //NONSEQ:2'b10; IDLE:2'b00 
assign hsize     = mem_3bytes    ? mem_3bytes_size :
                   mem_ahb_valid ? mem_size : if_size;
assign haddr     = mem_3bytes    ? mem_3bytes_addr :
                   mem_ahb_valid ? mem_addr : if_addr;
assign hwrite    = mem_3bytes    ? mem_3bytes_write :
                   mem_ahb_valid ? mem_wr : 1'b0;
assign hwdata    = ahb_wdata;

assign hburst    = 3'd0;
assign hmastlock = 1'b0;
assign hprot     = 4'd0;
//-------------------------{ahb-lite}end------------------------------//

//---------------------{fetch interface}begin-------------------------//
reg if_wait_ahb_data;
reg if_wait_i_sram_data;
reg if_wait_d_sram_data;
always @(posedge hclk)
begin
    if (!hresetn)
    begin
        if_wait_ahb_data <= 1'b0;
    end
    else if (if_ahb_valid && !mem_ahb_valid && !mem_3bytes && hreadyout)
    begin
        if_wait_ahb_data <= 1'b1;
    end
    else if (!mem_3bytes && hreadyout)
    begin
        if_wait_ahb_data <= 1'b0;
    end

    if (!hresetn)
    begin
        if_wait_i_sram_data <= 1'b0;
    end
    else if (!mem_i_sram_valid && if_i_sram_valid)
    begin
        if_wait_i_sram_data <= 1'b1;
    end
    else
    begin
        if_wait_i_sram_data <= 1'b0;
    end

    if (!hresetn)
    begin
        if_wait_d_sram_data <= 1'b0;
    end
    else if (!mem_d_sram_valid && if_d_sram_valid)
    begin
        if_wait_d_sram_data <= 1'b1;
    end
    else
    begin
        if_wait_d_sram_data <= 1'b0;
    end
end

assign if_addr_ok = if_ahb_valid     ? (mem_3bytes||mem_ahb_valid ? 1'b0 : hreadyout) :
                    if_wait_ahb_data ? hreadyout                                      :
                    if_i_sram_valid  ? !mem_i_sram_valid : !mem_d_sram_valid          ; 
assign if_data_ok = if_wait_ahb_data ? hreadyout : if_wait_i_sram_data||if_wait_d_sram_data;
assign if_rdata   = if_wait_ahb_data ? hrdata : 
                    if_wait_i_sram_data ? inst_dout : data_dout;
//----------------------{fetch interface}end--------------------------//

//----------------------{mem interface}begin--------------------------//
reg mem_wait_ahb_data;
reg mem_wait_i_sram_data;
reg mem_wait_d_sram_data;
always @(posedge hclk)
begin
    if (!hresetn)
    begin
        mem_wait_ahb_data <= 1'b0;
    end
    else if (mem_ahb_valid && !mem_3bytes && hreadyout)
    begin
        mem_wait_ahb_data <= 1'b1;
    end
    else if (!mem_3bytes && hreadyout)
    begin
        mem_wait_ahb_data <= 1'b0;
    end

    if (!hresetn)
    begin
        mem_wait_i_sram_data <= 1'b0;
    end
    else if (mem_i_sram_valid)
    begin
        mem_wait_i_sram_data <= 1'b1;
    end
    else
    begin
        mem_wait_i_sram_data <= 1'b0;
    end

    if (!hresetn)
    begin
        mem_wait_d_sram_data <= 1'b0;
    end
    else if (mem_d_sram_valid)
    begin
        mem_wait_d_sram_data <= 1'b1;
    end
    else
    begin
        mem_wait_d_sram_data <= 1'b0;
    end
end

//mem 3bytes data
reg        mem_con;
reg [15:0] mem_3bytes_data;
always @(posedge hclk)
begin
    if(mem_3bytes && hreadyout)
    begin
        mem_3bytes_data <= hrdata[15:0];
    end

    if (!hresetn)
    begin
        mem_con <= 1'b0;
    end
    else if (mem_3bytes && hreadyout)
    begin
        mem_con <= 1'b1;
    end
    else if (hreadyout)
    begin
        mem_con <= 1'b0;
    end
end
wire [31:0] mem_ahb_data;
assign mem_ahb_data = mem_con ? {hrdata[31:16],mem_3bytes_data} : hrdata;

assign mem_addr_ok = mem_ahb_valid ? (mem_3bytes ? 1'b0 : hreadyout) : 
                     mem_wait_ahb_data ? hreadyout : 1'b1; 
assign mem_data_ok = mem_wait_ahb_data ? (mem_3bytes ? 1'b0 : hreadyout) :
                                         mem_wait_i_sram_data||mem_wait_d_sram_data;
assign mem_rdata   = mem_wait_ahb_data ? mem_ahb_data : 
                     mem_wait_i_sram_data ? inst_dout : data_dout;
//-----------------------{mem interface}end---------------------------//
endmodule
