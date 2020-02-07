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

`define Lconfbus      10
`define Lconfret       9
`define Lconfbusreg   64
`define Lconfbusaddr  16

`define ORDER_REG_ADDR          16'h1160

`define Lawcmd 4
`define Lawdirqid 4
`define Lawstate 2
`define Lawscseti 2
`define Lawid 4
`define Lawaddr 32 
`define Lawlen 8
`define Lawsize 3
`define Lawburst 2
`define Lawlock 2
`define Lawcache 4
`define Lawprot 3
`define Lawvalid 1
`define Lawready 1
`define Lwid 4
`define Lwdata 32 
`define Lwstrb 4
`define Lwlast 1
`define Lwvalid 1
`define Lwready 1
`define Lbid 4
`define Lbresp 2
`define Lbvalid 1
`define Lbready 1
`define Larcmd 4
`define Larcpuno 10
`define Larid 4
`define Laraddr 32
`define Larlen 8
`define Larsize 3
`define Larburst 2
`define Larlock 2
`define Larcache 4
`define Larprot 3
`define Larvalid 1
`define Larready 1
`define Lrstate 2
`define Lrscseti 2
`define Lrid 4
`define Lrdata 32
`define Lrresp 2
`define Lrlast 1
`define Lrvalid 1
`define Lrready 1
`define Lrrequest 1
/*************************/
`define LID 4
`define LADDR 32
`define LLEN 8
`define LSIZE 3
`define LDATA 32
`define LSTRB 4
`define LBURST 2
`define LLOCK 2
`define LCACHE 4
`define LPROT 3
`define LRESP 2
/************************************/


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

module soc_up_top #(parameter SIMULATION=1'b0)
(
    input         resetn, 
    input         clk,
    
    //------uart controller-------
    input uart_rxd,
    output uart_txd,

    //------mac controller-------
    output MDIO_mdc,
    inout MDIO_mdio_io,
    input MII_col,
    input MII_crs,
    output MII_rst_n,
    input MII_rx_clk,
    input MII_rx_dv,
    input MII_rx_er,
    input [3:0]MII_rxd,
    input MII_tx_clk,
    output MII_tx_en,
    output [3:0]MII_txd,

    //------DDR3 interface------
    inout  [15:0] ddr3_dq,
    output [12:0] ddr3_addr,
    output [2 :0] ddr3_ba,
    output        ddr3_ras_n,
    output        ddr3_cas_n,
    output        ddr3_we_n,
    output        ddr3_odt,
    output        ddr3_reset_n,
    output        ddr3_cke,
    output [1:0]  ddr3_dm,
    inout  [1:0]  ddr3_dqs_p,
    inout  [1:0]  ddr3_dqs_n,
    output        ddr3_ck_p,
    output        ddr3_ck_n,
    
    //------VGA--------
    output [3:0] VGA_red,
    output [3:0] VGA_green,
    output [3:0] VGA_blue,
    output VGA_hsync,
    output VGA_vsync,

    //------gpio-------
    output [15:0] led,
    output [1 :0] led_rg0,
    output [1 :0] led_rg1,
    output [7 :0] num_csn,
    output [6 :0] num_a_g,
    input  [7 :0] switch, 
    output [3 :0] btn_key_col,
    input  [3 :0] btn_key_row,
    input  [1 :0] btn_step
);
//debug signals
wire [31:0] debug_wb_pc;
wire [3 :0] debug_wb_rf_wen;
wire [4 :0] debug_wb_rf_wnum;
wire [31:0] debug_wb_rf_wdata;

//clk and resetn
wire cpu_clk;
wire vga_clk;
wire timer_clk;
wire c1_clk_ref_i;
wire aclk;
wire aresetn;

clk_pll clk_pll
(
    .clk_in1 (clk),
    .cpu_clk (cpu_clk),
    .timer_clk (timer_clk),
    .clk_200M_ddr_ref_clk(c1_clk_ref_i),
    .vga_clk(vga_clk)
);

// memory interface generator: ddr3
wire [`LID         -1 :0] s0_awid;
wire [`Lawaddr     -1 :0] s0_awaddr;
wire [`Lawlen      -1 :0] s0_awlen;
wire [`Lawsize     -1 :0] s0_awsize;
wire [`Lawburst    -1 :0] s0_awburst;
wire [`Lawlock     -1 :0] s0_awlock;
wire [`Lawcache    -1 :0] s0_awcache;
wire [`Lawprot     -1 :0] s0_awprot;
wire                      s0_awvalid;
wire                      s0_awready;
wire [`LID         -1 :0] s0_wid;
wire [`Lwdata      -1 :0] s0_wdata;
wire [`Lwstrb      -1 :0] s0_wstrb;
wire                      s0_wlast;
wire                      s0_wvalid;
wire                      s0_wready;
wire [`LID         -1 :0] s0_bid;
wire [`Lbresp      -1 :0] s0_bresp;
wire                      s0_bvalid;
wire                      s0_bready;
wire [`LID         -1 :0] s0_arid;
wire [`Laraddr     -1 :0] s0_araddr;
wire [`Larlen      -1 :0] s0_arlen;
wire [`Larsize     -1 :0] s0_arsize;
wire [`Larburst    -1 :0] s0_arburst;
wire [`Larlock     -1 :0] s0_arlock;
wire [`Larcache    -1 :0] s0_arcache;
wire [`Larprot     -1 :0] s0_arprot;
wire                      s0_arvalid;
wire                      s0_arready;
wire [`LID         -1 :0] s0_rid;
wire [`Lrdata      -1 :0] s0_rdata;
wire [`Lrresp      -1 :0] s0_rresp;
wire                      s0_rlast;
wire                      s0_rvalid;
wire                      s0_rready;

wire [8            -1 :0] mig_awid;
wire [`Lawaddr     -1 :0] mig_awaddr;
wire [8            -1 :0] mig_awlen;
wire [`Lawsize     -1 :0] mig_awsize;
wire [`Lawburst    -1 :0] mig_awburst;
wire [`Lawlock     -1 :0] mig_awlock;
wire [`Lawcache    -1 :0] mig_awcache;
wire [`Lawprot     -1 :0] mig_awprot;
wire                      mig_awvalid;
wire                      mig_awready;
wire [8            -1 :0] mig_wid;
wire [`Lwdata      -1 :0] mig_wdata;
wire [`Lwstrb      -1 :0] mig_wstrb;
wire                      mig_wlast;
wire                      mig_wvalid;
wire                      mig_wready;
wire [8            -1 :0] mig_bid;
wire [`Lbresp      -1 :0] mig_bresp;
wire                      mig_bvalid;
wire                      mig_bready;
wire [8            -1 :0] mig_arid;
wire [`Laraddr     -1 :0] mig_araddr;
wire [8            -1 :0] mig_arlen;
wire [`Larsize     -1 :0] mig_arsize;
wire [`Larburst    -1 :0] mig_arburst;
wire [`Larlock     -1 :0] mig_arlock;
wire [`Larcache    -1 :0] mig_arcache;
wire [`Larprot     -1 :0] mig_arprot;
wire                      mig_arvalid;
wire                      mig_arready;
wire [8            -1 :0] mig_rid;
wire [`Lrdata      -1 :0] mig_rdata;
wire [`Lrresp      -1 :0] mig_rresp;
wire                      mig_rlast;
wire                      mig_rvalid;
wire                      mig_rready;

//for lab6
wire [4 :0] ram_random_mask;

wire MDIO_mdio_i;
wire MDIO_mdio_o;
wire MDIO_mdio_t;
  
IOBUF MDIO_mdio_iobuf
   (.I(MDIO_mdio_o),
    .IO(MDIO_mdio_io),
    .O(MDIO_mdio_i),
    .T(MDIO_mdio_t));
        
noop_design u_cpu(
    .interrupt (6'd0          ),   //high active

    .cpu_clk   (cpu_clk       ),
    .clk_100M  (timer_clk     ),
    .aresetn   (aresetn       ),   //low active
    
    // for divide generator, must be 1
    .dcm_locked(1'd1),
    
    //  uartlite
    .uart_rxd(uart_rxd),
    .uart_txd(uart_txd),

    //debug interface
    .debug_wb_pc      (debug_wb_pc      ),
    .debug_wb_rf_wen  (debug_wb_rf_wen  ),
    .debug_wb_rf_wnum (debug_wb_rf_wnum ),
    .debug_wb_rf_wdata(debug_wb_rf_wdata),

	// ddr3
    .ddr3_awid          (s0_awid        ),
    .ddr3_awaddr        (s0_awaddr      ),
    .ddr3_awlen         ({s0_awlen}     ),
    .ddr3_awsize        (s0_awsize      ),
    .ddr3_awburst       (s0_awburst     ),
    .ddr3_awlock        (s0_awlock[0:0] ),
    .ddr3_awcache       (s0_awcache     ),
    .ddr3_awprot        (s0_awprot      ),
    .ddr3_awqos         (                ),
    .ddr3_awvalid       (s0_awvalid     ),
    .ddr3_awready       (s0_awready     ),
    .ddr3_wdata         (s0_wdata       ),
    .ddr3_wstrb         (s0_wstrb       ),
    .ddr3_wlast         (s0_wlast       ),
    .ddr3_wvalid        (s0_wvalid      ),
    .ddr3_wready        (s0_wready      ),
    .ddr3_bid           (s0_bid         ),
    .ddr3_bresp         (s0_bresp       ),
    .ddr3_bvalid        (s0_bvalid      ),
    .ddr3_bready        (s0_bready      ),
    .ddr3_arid          (s0_arid        ),
    .ddr3_araddr        (s0_araddr      ),
    .ddr3_arlen         ({s0_arlen}     ),
    .ddr3_arsize        (s0_arsize      ),
    .ddr3_arburst       (s0_arburst     ),
    .ddr3_arlock        (s0_arlock[0:0] ),
    .ddr3_arcache       (s0_arcache     ),
    .ddr3_arprot        (s0_arprot      ),
    .ddr3_arqos         (                ),
    .ddr3_arvalid       (s0_arvalid     ),
    .ddr3_arready       (s0_arready     ),
    .ddr3_rid           (s0_rid         ),
    .ddr3_rdata         (s0_rdata       ),
    .ddr3_rresp         (s0_rresp       ),
    .ddr3_rlast         (s0_rlast       ),
    .ddr3_rvalid        (s0_rvalid      ),
    .ddr3_rready        (s0_rready      ),

    // ethernet
    .MDIO_mdc(MDIO_mdc),
    .MDIO_mdio_i(MDIO_mdio_i),
    .MDIO_mdio_o(MDIO_mdio_o),
    .MDIO_mdio_t(MDIO_mdio_t),
    .MII_col(MII_col),
    .MII_crs(MII_crs),
    .MII_rst_n(MII_rst_n),
    .MII_rx_clk(MII_rx_clk),
    .MII_rx_dv(MII_rx_dv),
    .MII_rx_er(MII_rx_er),
    .MII_rxd(MII_rxd),
    .MII_tx_clk(MII_tx_clk),
    .MII_tx_en(MII_tx_en),
    .MII_txd(MII_txd),
    
    // VGA
    .vga_clk(vga_clk),
	.VGA_blue(VGA_blue),
    .VGA_red(VGA_red),
    .VGA_green(VGA_green),
    .VGA_hsync(VGA_hsync),
    .VGA_vsync(VGA_vsync),

	// confreg
    .ram_random_mask ( ram_random_mask ),
    .led         ( led        ),  // o, 16   
    .led_rg0     ( led_rg0    ),  // o, 2      
    .led_rg1     ( led_rg1    ),  // o, 2      
    .num_csn     ( num_csn    ),  // o, 8      
    .num_a_g     ( num_a_g    ),  // o, 7      
    .switch      ( switch     ),  // i, 8     
    .btn_key_col ( btn_key_col),  // o, 4          
    .btn_key_row ( btn_key_row),  // i, 4           
    .btn_step    ( btn_step   )   // i, 2   
);

wire c1_sys_clk_i;
wire c1_sys_rst_i;
wire c1_calib_done;
wire c1_clk0;
wire c1_rst0;
wire ddr_aresetn;
assign c1_sys_clk_i      = clk;
assign c1_sys_rst_i      = resetn;
if(SIMULATION == 1) begin
  assign aclk              = c1_clk0;
end else begin
  assign aclk              = cpu_clk;
end

// Reset to the AXI shim
reg c1_calib_done_0;
reg c1_calib_done_1;
reg c1_rst0_0;
reg c1_rst0_1;
reg interconnect_aresetn;
reg interconnect_aresetn_0;


if(SIMULATION == 1) begin
    always @(posedge aclk)
    begin
        c1_calib_done_0 <= c1_calib_done;
        c1_calib_done_1 <= c1_calib_done_0;
        c1_rst0_0       <= c1_rst0;
        c1_rst0_1       <= c1_rst0_0;
    
        interconnect_aresetn_0 <= ~c1_rst0_1 && c1_calib_done_1;
        interconnect_aresetn   <= interconnect_aresetn_0 ;
    end
end else begin
    always @(posedge c1_clk0)
    begin
        interconnect_aresetn <= ~c1_rst0 && c1_calib_done;
    end
end

//axi 1x1, I don't know why this IP is needed (fuck)
axi_interconnect_0 mig_axi_interconnect (
    .INTERCONNECT_ACLK    (c1_clk0             ),
    .INTERCONNECT_ARESETN (interconnect_aresetn),
    .S00_AXI_ARESET_OUT_N (aresetn             ),
    .S00_AXI_ACLK         (aclk                ),
    .S00_AXI_AWID         (s0_awid[3:0]        ),
    .S00_AXI_AWADDR       (s0_awaddr           ),
    .S00_AXI_AWLEN        ({4'b0,s0_awlen}     ),
    .S00_AXI_AWSIZE       (s0_awsize           ),
    .S00_AXI_AWBURST      (s0_awburst          ),
    .S00_AXI_AWLOCK       (s0_awlock[0:0]      ),
    .S00_AXI_AWCACHE      (s0_awcache          ),
    .S00_AXI_AWPROT       (s0_awprot           ),
    .S00_AXI_AWQOS        (4'b0                ),
    .S00_AXI_AWVALID      (s0_awvalid          ),
    .S00_AXI_AWREADY      (s0_awready          ),
    .S00_AXI_WDATA        (s0_wdata            ),
    .S00_AXI_WSTRB        (s0_wstrb            ),
    .S00_AXI_WLAST        (s0_wlast            ),
    .S00_AXI_WVALID       (s0_wvalid           ),
    .S00_AXI_WREADY       (s0_wready           ),
    .S00_AXI_BID          (s0_bid[3:0]         ),
    .S00_AXI_BRESP        (s0_bresp            ),
    .S00_AXI_BVALID       (s0_bvalid           ),
    .S00_AXI_BREADY       (s0_bready           ),
    .S00_AXI_ARID         (s0_arid[3:0]        ),
    .S00_AXI_ARADDR       (s0_araddr           ),
    .S00_AXI_ARLEN        ({4'b0,s0_arlen}     ),
    .S00_AXI_ARSIZE       (s0_arsize           ),
    .S00_AXI_ARBURST      (s0_arburst          ),
    .S00_AXI_ARLOCK       (s0_arlock[0:0]      ),
    .S00_AXI_ARCACHE      (s0_arcache          ),
    .S00_AXI_ARPROT       (s0_arprot           ),
    .S00_AXI_ARQOS        (4'b0                ),
    .S00_AXI_ARVALID      (s0_arvalid          ),
    .S00_AXI_ARREADY      (s0_arready          ),
    .S00_AXI_RID          (s0_rid[3:0]         ),
    .S00_AXI_RDATA        (s0_rdata            ),
    .S00_AXI_RRESP        (s0_rresp            ),
    .S00_AXI_RLAST        (s0_rlast            ),
    .S00_AXI_RVALID       (s0_rvalid           ),
    .S00_AXI_RREADY       (s0_rready           ),

    .M00_AXI_ARESET_OUT_N (ddr_aresetn         ),
    .M00_AXI_ACLK         (c1_clk0             ),
    .M00_AXI_AWID         (mig_awid            ),
    .M00_AXI_AWADDR       (mig_awaddr          ),
    .M00_AXI_AWLEN        ({mig_awlen}         ),
    .M00_AXI_AWSIZE       (mig_awsize          ),
    .M00_AXI_AWBURST      (mig_awburst         ),
    .M00_AXI_AWLOCK       (mig_awlock[0:0]     ),
    .M00_AXI_AWCACHE      (mig_awcache         ),
    .M00_AXI_AWPROT       (mig_awprot          ),
    .M00_AXI_AWQOS        (                    ),
    .M00_AXI_AWVALID      (mig_awvalid         ),
    .M00_AXI_AWREADY      (mig_awready         ),
    .M00_AXI_WDATA        (mig_wdata           ),
    .M00_AXI_WSTRB        (mig_wstrb           ),
    .M00_AXI_WLAST        (mig_wlast           ),
    .M00_AXI_WVALID       (mig_wvalid          ),
    .M00_AXI_WREADY       (mig_wready          ),
    .M00_AXI_BID          (mig_bid             ),
    .M00_AXI_BRESP        (mig_bresp           ),
    .M00_AXI_BVALID       (mig_bvalid          ),
    .M00_AXI_BREADY       (mig_bready          ),
    .M00_AXI_ARID         (mig_arid            ),
    .M00_AXI_ARADDR       (mig_araddr          ),
    .M00_AXI_ARLEN        ({mig_arlen}         ),
    .M00_AXI_ARSIZE       (mig_arsize          ),
    .M00_AXI_ARBURST      (mig_arburst         ),
    .M00_AXI_ARLOCK       (mig_arlock[0:0]     ),
    .M00_AXI_ARCACHE      (mig_arcache         ),
    .M00_AXI_ARPROT       (mig_arprot          ),
    .M00_AXI_ARQOS        (                    ),
    .M00_AXI_ARVALID      (mig_arvalid         ),
    .M00_AXI_ARREADY      (mig_arready         ),
    .M00_AXI_RID          (mig_rid             ),
    .M00_AXI_RDATA        (mig_rdata           ),
    .M00_AXI_RRESP        (mig_rresp           ),
    .M00_AXI_RLAST        (mig_rlast           ),
    .M00_AXI_RVALID       (mig_rvalid          ),
    .M00_AXI_RREADY       (mig_rready          )
);

//ddr3 controller
mig_axi_32 mig_axi (
    // Inouts
    .ddr3_dq             (ddr3_dq         ),  
    .ddr3_dqs_p          (ddr3_dqs_p      ),    // for X16 parts 
    .ddr3_dqs_n          (ddr3_dqs_n      ),  // for X16 parts
    // Outputs
    .ddr3_addr           (ddr3_addr       ),  
    .ddr3_ba             (ddr3_ba         ),
    .ddr3_ras_n          (ddr3_ras_n      ),                        
    .ddr3_cas_n          (ddr3_cas_n      ),                        
    .ddr3_we_n           (ddr3_we_n       ),                          
    .ddr3_reset_n        (ddr3_reset_n    ),
    .ddr3_ck_p           (ddr3_ck_p       ),                          
    .ddr3_ck_n           (ddr3_ck_n       ),       
    .ddr3_cke            (ddr3_cke        ),                          
    .ddr3_dm             (ddr3_dm         ),
    .ddr3_odt            (ddr3_odt        ),
    
	.ui_clk              (c1_clk0         ),
    .ui_clk_sync_rst     (c1_rst0         ),
 
    .sys_clk_i           (c1_sys_clk_i    ),
    .sys_rst             (c1_sys_rst_i    ),                        
    .init_calib_complete (c1_calib_done   ),
    .clk_ref_i           (c1_clk_ref_i    ),
    .mmcm_locked         (                ),
	
	.app_sr_active       (                ),
    .app_ref_ack         (                ),
    .app_zq_ack          (                ),
    .app_sr_req          (1'b0            ),
    .app_ref_req         (1'b0            ),
    .app_zq_req          (1'b0            ),
    
    .aresetn             (ddr_aresetn     ),
    .s_axi_awid          (mig_awid        ),
    .s_axi_awaddr        (mig_awaddr[26:0]),
    .s_axi_awlen         ({mig_awlen}     ),
    .s_axi_awsize        (mig_awsize      ),
    .s_axi_awburst       (mig_awburst     ),
    .s_axi_awlock        (mig_awlock[0:0] ),
    .s_axi_awcache       (mig_awcache     ),
    .s_axi_awprot        (mig_awprot      ),
    .s_axi_awqos         (4'b0            ),
    .s_axi_awvalid       (mig_awvalid     ),
    .s_axi_awready       (mig_awready     ),
    .s_axi_wdata         (mig_wdata       ),
    .s_axi_wstrb         (mig_wstrb       ),
    .s_axi_wlast         (mig_wlast       ),
    .s_axi_wvalid        (mig_wvalid      ),
    .s_axi_wready        (mig_wready      ),
    .s_axi_bid           (mig_bid         ),
    .s_axi_bresp         (mig_bresp       ),
    .s_axi_bvalid        (mig_bvalid      ),
    .s_axi_bready        (mig_bready      ),
    .s_axi_arid          (mig_arid        ),
    .s_axi_araddr        (mig_araddr[26:0]),
    .s_axi_arlen         ({mig_arlen}     ),
    .s_axi_arsize        (mig_arsize      ),
    .s_axi_arburst       (mig_arburst     ),
    .s_axi_arlock        (mig_arlock[0:0] ),
    .s_axi_arcache       (mig_arcache     ),
    .s_axi_arprot        (mig_arprot      ),
    .s_axi_arqos         (4'b0            ),
    .s_axi_arvalid       (mig_arvalid     ),
    .s_axi_arready       (mig_arready     ),
    .s_axi_rid           (mig_rid         ),
    .s_axi_rdata         (mig_rdata       ),
    .s_axi_rresp         (mig_rresp       ),
    .s_axi_rlast         (mig_rlast       ),
    .s_axi_rvalid        (mig_rvalid      ),
    .s_axi_rready        (mig_rready      )
);

endmodule

