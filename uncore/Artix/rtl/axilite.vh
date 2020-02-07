/* AXI4 Lite */

`define make_axilite_slave(prefix, data_len, byte_len, addr_len)\
input [addr_len-1:0] prefix``_araddr,\
output prefix``_arready,\
input prefix``_arvalid,\
input [addr_len-1:0] prefix``_awaddr,\
output prefix``_awready,\
input prefix``_awvalid,\
input prefix``_bready,\
output prefix``_bvalid,\
output [1:0] prefix``_bresp,\
output [data_len-1:0] prefix``_rdata,\
input prefix``_rready,\
output prefix``_rvalid,\
output [1:0] prefix``_rresp,\
input [data_len-1:0] prefix``_wdata,\
output prefix``_wready,\
input prefix``_wvalid,\
input [byte_len-1:0] prefix``_wstrb

`define make_axilite_wire(prefix, data_len, byte_len, addr_len)\
wire [addr_len-1:0] prefix``_araddr;\
wire prefix``_arready;\
wire prefix``_arvalid;\
wire [addr_len-1:0] prefix``_awaddr;\
wire prefix``_awready;\
wire prefix``_awvalid;\
wire prefix``_bready;\
wire prefix``_bvalid;\
wire [1:0] prefix``_bresp;\
wire [data_len-1:0] prefix``_rdata;\
wire prefix``_rready;\
wire prefix``_rvalid;\
wire [1:0] prefix``_rresp;\
wire [data_len-1:0] prefix``_wdata;\
wire prefix``_wready;\
wire prefix``_wvalid;\
wire [byte_len-1:0] prefix``_wstrb

`define make_axilite_master(prefix, data_len, byte_len, addr_len)\
output [addr_len-1:0] prefix``_araddr,\
input prefix``_arready,\
output prefix``_arvalid,\
output [addr_len-1:0] prefix``_awaddr,\
input prefix``_awready,\
output prefix``_awvalid,\
output prefix``_bready,\
input prefix``_bvalid,\
input [1:0] prefix``_bresp,\
input [data_len-1:0] prefix``_rdata,\
output prefix``_rready,\
input prefix``_rvalid,\
input [1:0] prefix``_rresp,\
output [data_len-1:0] prefix``_wdata,\
input prefix``_wready,\
output prefix``_wvalid,\
output [byte_len-1:0] prefix``_wstrb

`define make_axilite_connect(prefix1, prefix2)\
.prefix1``_araddr(prefix2``_araddr),\
.prefix1``_arready(prefix2``_arready),\
.prefix1``_arvalid(prefix2``_arvalid),\
.prefix1``_awaddr(prefix2``_awaddr),\
.prefix1``_awready(prefix2``_awready),\
.prefix1``_awvalid(prefix2``_awvalid),\
.prefix1``_bready(prefix2``_bready),\
.prefix1``_bvalid(prefix2``_bvalid),\
.prefix1``_bresp(prefix2``_bresp),\
.prefix1``_rdata(prefix2``_rdata),\
.prefix1``_rready(prefix2``_rready),\
.prefix1``_rvalid(prefix2``_rvalid),\
.prefix1``_rresp(prefix2``_rresp),\
.prefix1``_wdata(prefix2``_wdata),\
.prefix1``_wready(prefix2``_wready),\
.prefix1``_wvalid(prefix2``_wvalid),\
.prefix1``_wstrb(prefix2``_wstrb)

`define make_extra_connect(prefix1, prefix2)\
.prefix1``_awlen(4'd0),\
.prefix1``_arlen(4'd0),\
.prefix1``_arsize(3'b010)\
.prefix1``_awsize(3'b010)\
.prefix1``_arburst(2'b00)\
.prefix1``_awburst(2'b00)\
.prefix1``_awlock(2'b00)\
.prefix1``_arlock(2'b00)\
.prefix1``_arcache(4'b0000)\
.prefix1``_awcache(4'b0000)\
.prefix1``_awprot(3'b000)\
.prefix1``_arprot(3'b000)\


/* AXI4 */


`define make_axi4_wire(prefix, data_len, byte_len, addr_len)\
  wire [addr_len-1:0]   prefix``_awaddr;\
  wire [7:0]    prefix``_awlen;\
  wire [2:0]    prefix``_awsize;\
  wire [1:0]    prefix``_awburst;\
  wire [0:0]    prefix``_awlock;\
  wire [3:0]    prefix``_awcache;\
  wire [2:0]    prefix``_awprot;\
  wire [3:0]    prefix``_awqos;\
  wire          prefix``_awvalid;\
  wire          prefix``_awready;\
  wire [data_len-1:0]   prefix``_wdata;\
  wire [byte_len-1:0]    prefix``_wstrb;\
  wire          prefix``_wlast;\
  wire          prefix``_wvalid;\
  wire          prefix``_wready;\
  wire [1:0]    prefix``_bresp;\
  wire          prefix``_bvalid;\
  wire          prefix``_bready;\
  wire [addr_len-1:0]   prefix``_araddr;\
  wire [7:0]    prefix``_arlen;\
  wire [2:0]    prefix``_arsize;\
  wire [1:0]    prefix``_arburst;\
  wire [0:0]    prefix``_arlock;\
  wire [3:0]    prefix``_arcache;\
  wire [2:0]    prefix``_arprot;\
  wire [3:0]    prefix``_arqos;\
  wire          prefix``_arvalid;\
  wire          prefix``_arready;\
  wire [data_len-1:0]   prefix``_rdata;\
  wire [1:0]    prefix``_rresp;\
  wire          prefix``_rlast;\
  wire          prefix``_rvalid;\
  wire          prefix``_rready;



`define make_axi4_connect(prefix1, prefix2)\
.prefix1``_awaddr(prefix2``_awaddr),\
.prefix1``_awlen(prefix2``_awlen),\
.prefix1``_awsize(prefix2``_awsize),\
.prefix1``_awburst(prefix2``_awburst),\
.prefix1``_awlock(prefix2``_awlock),\
.prefix1``_awcache(prefix2``_awcache),\
.prefix1``_awprot(prefix2``_awprot),\
.prefix1``_awqos(prefix2``_awqos),\
.prefix1``_awvalid(prefix2``_awvalid),\
.prefix1``_awready(prefix2``_awready),\
.prefix1``_wdata(prefix2``_wdata),\
.prefix1``_wstrb(prefix2``_wstrb),\
.prefix1``_wlast(prefix2``_wlast),\
.prefix1``_wvalid(prefix2``_wvalid),\
.prefix1``_wready(prefix2``_wready),\
.prefix1``_bresp(prefix2``_bresp),\
.prefix1``_bvalid(prefix2``_bvalid),\
.prefix1``_bready(prefix2``_bready),\
.prefix1``_araddr(prefix2``_araddr),\
.prefix1``_arlen(prefix2``_arlen),\
.prefix1``_arsize(prefix2``_arsize),\
.prefix1``_arburst(prefix2``_arburst),\
.prefix1``_arlock(prefix2``_arlock),\
.prefix1``_arcache(prefix2``_arcache),\
.prefix1``_arprot(prefix2``_arprot),\
.prefix1``_arqos(prefix2``_arqos),\
.prefix1``_arvalid(prefix2``_arvalid),\
.prefix1``_arready(prefix2``_arready),\
.prefix1``_rdata(prefix2``_rdata),\
.prefix1``_rresp(prefix2``_rresp),\
.prefix1``_rlast(prefix2``_rlast),\
.prefix1``_rvalid(prefix2``_rvalid),\
.prefix1``_rready(prefix2``_rready)


//6 .PREFIX1``_AWCACHE(prefix2``_awcache),

`define MAKE_AXI4_CONNECT(PREFIX1, prefix2)\
.PREFIX1``_AWADDR(prefix2``_awaddr),\
.PREFIX1``_AWLEN(prefix2``_awlen),\
.PREFIX1``_AWSIZE(prefix2``_awsize),\
.PREFIX1``_AWBURST(prefix2``_awburst),\
.PREFIX1``_AWLOCK(prefix2``_awlock),\
.PREFIX1``_AWPROT(prefix2``_awprot),\
.PREFIX1``_AWQOS(prefix2``_awqos),\
.PREFIX1``_AWVALID(prefix2``_awvalid),\
.PREFIX1``_AWREADY(prefix2``_awready),\
.PREFIX1``_WDATA(prefix2``_wdata),\
.PREFIX1``_WSTRB(prefix2``_wstrb),\
.PREFIX1``_WLAST(prefix2``_wlast),\
.PREFIX1``_WVALID(prefix2``_wvalid),\
.PREFIX1``_WREADY(prefix2``_wready),\
.PREFIX1``_BRESP(prefix2``_bresp),\
.PREFIX1``_BVALID(prefix2``_bvalid),\
.PREFIX1``_BREADY(prefix2``_bready),\
.PREFIX1``_ARADDR(prefix2``_araddr),\
.PREFIX1``_ARLEN(prefix2``_arlen),\
.PREFIX1``_ARSIZE(prefix2``_arsize),\
.PREFIX1``_ARBURST(prefix2``_arburst),\
.PREFIX1``_ARLOCK(prefix2``_arlock),\
.PREFIX1``_ARPROT(prefix2``_arprot),\
.PREFIX1``_ARQOS(prefix2``_arqos),\
.PREFIX1``_ARVALID(prefix2``_arvalid),\
.PREFIX1``_ARREADY(prefix2``_arready),\
.PREFIX1``_RDATA(prefix2``_rdata),\
.PREFIX1``_RRESP(prefix2``_rresp),\
.PREFIX1``_RLAST(prefix2``_rlast),\
.PREFIX1``_RVALID(prefix2``_rvalid),\
.PREFIX1``_RREADY(prefix2``_rready)

//#10 .PREFIX1``_ARCACHE(prefix2``_arcache),
