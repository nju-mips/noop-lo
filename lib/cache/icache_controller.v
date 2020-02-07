`include "axi.vh"
module icache_controller # (
	parameter LINE_INDEX_WIDTH = 8,
	parameter DEPTH = 2 ** LINE_INDEX_WIDTH, //256 lines
	parameter WORD_INDEX_WIDTH = 3,
	parameter LINE_SIZE = ( 2 ** WORD_INDEX_WIDTH ) * 32
) (
	input clk,
	input rst,
	`axilite_slave_if(s_axi_instr),
	`axi_master_if(m_axi_ram, 64, 0),
	output  i_access,
	output  i_miss
);

	 
`ifdef HAS_CACHE	 
	reg [DEPTH - 1 : 0] valid_set;
	reg [32 - (LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2) - 1 : 0] tag_set [DEPTH - 1 : 0];
	reg [LINE_SIZE - 1 : 0] word_set [DEPTH - 1 : 0];

	wire [LINE_INDEX_WIDTH - 1 : 0]  index = s_axi_instr_araddr[(LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2) - 1 : WORD_INDEX_WIDTH + 2];
	wire [32 - (LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2) - 1 : 0] itag = s_axi_instr_araddr[31 : LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2];
	wire [WORD_INDEX_WIDTH - 1 : 0] word_sel = s_axi_instr_araddr[(WORD_INDEX_WIDTH + 2) - 1 : 2];


	wire hit = ((valid_set >> index) & 1) & (itag == tag_set[index]);
    
	parameter START = 0, WAIT_RAM_ARREADY = 1, WAIT_READ_FINISH = 2, WAIT_CACHE_WRITE = 3,  WAIT_IFU_RREADY = 4;

	reg [2 : 0] state;
	reg [1 : 0] burst_counter;
	reg [LINE_SIZE - 1 : 0] line_in;

	always @(posedge clk) begin
		if(rst) begin
			valid_set <= 0;
			burst_counter <= 0;
            
			state <= START;
        
		end
		else begin
		    case(state)
			START:
			begin
				if(s_axi_instr_arvalid & !hit) begin	
					if(m_axi_ram_arready & m_axi_ram_arvalid) begin
						state <= WAIT_READ_FINISH;
					end
					else begin
						state <= WAIT_RAM_ARREADY;
					end
				end
				
				if(s_axi_instr_arvalid & hit & !s_axi_instr_rready) begin
				    state <= WAIT_IFU_RREADY;
				end
			end
			WAIT_RAM_ARREADY:
			begin
				if(m_axi_ram_arready & m_axi_ram_arvalid) begin
					state <= WAIT_READ_FINISH;   
				end
		    end   
		    WAIT_READ_FINISH:
			begin
				if(m_axi_ram_rvalid) begin
					line_in[64 * burst_counter +: 64] <= m_axi_ram_rdata;
					burst_counter <= burst_counter + 1;
					if(m_axi_ram_rlast) begin

						state <= WAIT_CACHE_WRITE;
					end
				end
			end
			WAIT_CACHE_WRITE:
			begin
				word_set[index] <= line_in;
				tag_set[index] <= itag;
				valid_set <= (valid_set | (1 << index));
				state <= START;
			end
			
			 WAIT_IFU_RREADY:
			 begin
			     if(s_axi_instr_rready) begin
			         state <= START;
			     end
			 end
		    endcase
		end
	end

	//RAM interface
	//write address channel
//	assign m_axi_ram_awid = 1'b0;
	assign m_axi_ram_awaddr = 32'b0;
	assign m_axi_ram_awregion = 4'b0;
	assign m_axi_ram_awlen = 8'b0;
	assign m_axi_ram_awsize = 3'b0;
	assign m_axi_ram_awburst = 2'b0;
	assign m_axi_ram_awlock = 1'b0;
	assign m_axi_ram_awcache = 4'b0;
	assign m_axi_ram_awprot = 3'b0;
	assign m_axi_ram_awqos = 4'b0;
	assign m_axi_ram_awvalid = 1'b0;

	//write data channel
	assign m_axi_ram_wdata = 64'b0;
	assign m_axi_ram_wstrb = 8'b0;
	assign m_axi_ram_wlast = 1'b0;
	assign m_axi_ram_wvalid = 1'b0;

	//write response channel
	assign m_axi_ram_bready = 1'b1;

	//read address channel
//	assign m_axi_ram_arid = 1'b0;
	assign m_axi_ram_araddr = (s_axi_instr_araddr & ~(2 ** (WORD_INDEX_WIDTH + 2) - 1));
	assign m_axi_ram_arregion = 4'b0;
	assign m_axi_ram_arlen = 8'b0000_0011; //8B * 4
	assign m_axi_ram_arsize = 3'b011; //8 bytes
	assign m_axi_ram_arburst = 2'b01; //INCR type
	assign m_axi_ram_arlock = 1'b0;
	assign m_axi_ram_arcache = 4'b0;
	assign m_axi_ram_arprot = 3'b0;
	assign m_axi_ram_arqos = 4'b0;
	assign m_axi_ram_arvalid = (state == START & s_axi_instr_arvalid & !hit) | (state == WAIT_RAM_ARREADY);

	//read response channel
	assign m_axi_ram_rready = 1'b1;


	//IFU interface
	assign s_axi_instr_arready = 1'b1;
	assign s_axi_instr_rvalid = hit | (state == WAIT_IFU_RREADY);//TODO:IFU always ready?
	assign s_axi_instr_rdata = word_set[index][32 * word_sel +: 32];
	assign s_axi_instr_rresp = 2'b0;

	assign s_axi_instr_awready = 1'b0;
	assign s_axi_instr_wready = 1'b0;
	assign s_axi_instr_bresp = 2'b0;
	assign s_axi_instr_bvalid = 1'b0;
	
	assign i_access = (state == START & s_axi_instr_arvalid) ;
	assign i_miss = (state == START & s_axi_instr_arvalid & !hit);
`else 
/*	//RAM interface
	//write address channel
//	assign m_axi_ram_awid = 1'b0;
	assign m_axi_ram_awaddr = s_axi_instr_awaddr;
	assign m_axi_ram_awregion = 4'b0;
	assign m_axi_ram_awlen = 8'b0000_0000;//8B * 1
	assign m_axi_ram_awsize = 3'b011;//8B
	assign m_axi_ram_awburst = 2'b0;
	assign m_axi_ram_awlock = 1'b0;
	assign m_axi_ram_awcache = 4'b0;
	assign m_axi_ram_awprot = s_axi_instr_awprot;
	assign m_axi_ram_awqos = 4'b0;
	assign m_axi_ram_awvalid = s_axi_instr_awvalid;

	//write data channel
	assign m_axi_ram_wdata = s_axi_instr_wdata; //32bits -> 64bits
	assign m_axi_ram_wstrb = s_axi_instr_wstrb; //4bits -> 8bits
	assign m_axi_ram_wlast = 1'b0;
	assign m_axi_ram_wvalid = s_axi_instr_wvalid;

	//write response channel
	assign m_axi_ram_bready = s_axi_instr_bready;

	//read address channel
//	assign m_axi_ram_arid = 1'b0;
	assign m_axi_ram_araddr = s_axi_instr_araddr  & ~32'd7;
	assign m_axi_ram_arregion = 4'b0;
	assign m_axi_ram_arlen = 8'b0000_0000; //8B * 1
	assign m_axi_ram_arsize = 3'b011;//8B
	assign m_axi_ram_arburst = 2'b01; //INCR type
	assign m_axi_ram_arlock = 1'b0;
	assign m_axi_ram_arcache = 4'b0;
	assign m_axi_ram_arprot = s_axi_instr_arprot;
	assign m_axi_ram_arqos = 4'b0;
	assign m_axi_ram_arvalid = s_axi_instr_arvalid;

	//read response channel
	assign m_axi_ram_rready = s_axi_instr_rready;
	
	
	reg [31 : 0] instr;
	always @(*) begin
	   if(m_axi_ram_rvalid) begin
	       instr = m_axi_ram_rdata[32 * s_axi_instr_araddr[2] +: 32];
	   end
	end

	assign s_axi_instr_arready = m_axi_ram_arready;
	assign s_axi_instr_rvalid = m_axi_ram_rvalid;
	assign s_axi_instr_rdata = instr; //only low 32bits valid
	assign s_axi_instr_rresp = m_axi_ram_rresp;
	assign s_axi_instr_awready = m_axi_ram_awready;
	assign s_axi_instr_wready = m_axi_ram_wready;
	assign s_axi_instr_bresp = m_axi_ram_bresp;
	assign s_axi_instr_bvalid = m_axi_ram_bvalid;
    
	assign i_access = m_axi_ram_arready & s_axi_instr_arvalid;
	assign i_miss = 0;*/
`endif



endmodule
