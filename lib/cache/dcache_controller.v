`include "axi.vh"
module dcache_controller # (
	parameter LINE_INDEX_WIDTH = 8,
	parameter DEPTH = 2 ** LINE_INDEX_WIDTH, //256 lines
	parameter WORD_INDEX_WIDTH = 3,
	parameter LINE_SIZE = ( 2 ** WORD_INDEX_WIDTH ) * 32
) (
	input clk,
	input rst,
	output r_access,
	output w_access,
	output r_miss,
	output w_miss,
	
	output reg [63 : 0] r_miss_cycles,
	`axilite_slave_if(s_axi_data),
	`axi_master_if(m_axi_ram, 64, 0)
);

`ifdef HAS_CACHE
	wire [LINE_INDEX_WIDTH - 1 : 0] index;
	wire [32 - (LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2) - 1 : 0] dtag;
	wire [WORD_INDEX_WIDTH - 1 : 0] word_sel;
	reg [31 : 0] wdata;
	reg [3 : 0] wstrb;
	reg [31 : 0] addr;
	//write data
	always @(*) begin
		if(s_axi_data_wvalid) begin
			wstrb = s_axi_data_wstrb;
			wdata = s_axi_data_wdata;
		end
	end	

	//read or write addr
	always @(*) begin
		if(s_axi_data_awvalid) begin
			addr = s_axi_data_awaddr;
		end
		else if(s_axi_data_arvalid) begin
			addr = s_axi_data_araddr;
		end
	end

	assign index = addr[(LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2) - 1 : WORD_INDEX_WIDTH + 2];
	assign dtag = addr[31 : LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2];
	assign word_sel = addr[(WORD_INDEX_WIDTH + 2) - 1 : 2];

	reg [LINE_SIZE / 8 - 1 : 0] line_byte_wen; //cache line byte write en
	reg tag_wen; //cache tag wen

	reg [DEPTH - 1 : 0] valid;

	reg [32 - (LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2) - 1 : 0] tag_in;
	wire [32 - (LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2) - 1 : 0] tag_out;

	rams_sp_rf #(
		.RAM_ADDR_WIDTH(LINE_INDEX_WIDTH),
		.RAM_DATA_WIDTH((32 - (LINE_INDEX_WIDTH + WORD_INDEX_WIDTH + 2)))
	) tag_set (
		.clk(clk),
		.en(1'b1),
		.wen(tag_wen),
		.addr(index),
		.din(tag_in),
		.dout(tag_out)
	);

	reg [LINE_SIZE - 1 : 0] line_in;
	wire [LINE_SIZE - 1 : 0] line_out;

	bytewrite_sp_ram_rf #(
		.RAM_ADDR_WIDTH(LINE_INDEX_WIDTH),
		.RAM_DATA_WIDTH(LINE_SIZE)
	) line_set (
		.clk(clk),
		.en(1'b1),
		.wen(line_byte_wen),
		.addr(index),
		.din(line_in),
		.dout(line_out)
	);

	wire hit = ((valid >> index) & 1) & (dtag == tag_out);

	parameter START = 0, JUDGE_READ_HIT = 1, WAIT_RAM_RVALID = 2, WAIT_CACHE_LINE_WRITE = 3,
		  WAIT_CACHE_LINE_OUT = 4, WAIT_LSU_WVALID = 5, WAIT_LSU_AWVALID = 6,
		  JUDGE_WRITE_HIT = 7, WAIT_RAM_WREADY = 8, WAIT_RAM_AWREADY = 9,
		  WAIT_RAM_BVALID = 10, WAIT_LSU_BREADY = 11, WAIT_CACHE_WORD_WRITE = 12,
		  WAIT_LSU_RREADY = 13, WAIT_RAM_WREADY_AWREADY = 14, WAIT_RAM_ARREADY = 15;

	reg [3 : 0] state;
	reg [1 : 0] burst_counter;

	always @(posedge clk) begin
		if(rst) begin
			valid <= 0;

			line_byte_wen <= 0;
			tag_wen <= 0;
			burst_counter <= 0;
			r_miss_cycles <= 0;

			state <= START;
		end
		else begin
			case(state) 
				START:
				begin
					if(s_axi_data_arvalid) begin
						state <= JUDGE_READ_HIT;
					end

					if(s_axi_data_awvalid & s_axi_data_wvalid) begin
						state <= JUDGE_WRITE_HIT;
					end
					else begin
						if(s_axi_data_awvalid) begin
							state <= WAIT_LSU_WVALID;
						end

						if(s_axi_data_wvalid) begin
							state <= WAIT_LSU_AWVALID;
						end
					end
				end

				JUDGE_READ_HIT: //bram out valid
				begin
					if(hit) begin //cache read
						if(s_axi_data_rready) begin
							state <= START;
						end
						else begin
							state <= WAIT_LSU_RREADY;
						end
					end
					else begin //cache miss
						r_miss_cycles <= r_miss_cycles + 1;
						if(m_axi_ram_arready & m_axi_ram_arvalid) begin
							state <= WAIT_RAM_RVALID;
						end
						else begin
							state <= WAIT_RAM_ARREADY;
						end						
					end
				end

				WAIT_RAM_RVALID:
				begin
					r_miss_cycles <= r_miss_cycles + 1;
					if(m_axi_ram_rvalid) begin
						line_in[64 * burst_counter +: 64] <= m_axi_ram_rdata;
						burst_counter <= burst_counter + 1;
						if(m_axi_ram_rlast) begin
							tag_wen <= 1'b1;
							line_byte_wen <= {(LINE_SIZE / 8){1'b1}};
							tag_in <= dtag;
							valid <= (valid | (1 << index));

							state <= WAIT_CACHE_LINE_WRITE;
						end
					end

				end

				WAIT_CACHE_LINE_WRITE:
				begin
					r_miss_cycles <= r_miss_cycles + 1;
					tag_wen <= 1'b0;
					line_byte_wen <= 0;
					
					state <= WAIT_CACHE_LINE_OUT;
				end

				WAIT_CACHE_LINE_OUT:
				begin
					r_miss_cycles <= r_miss_cycles + 1;
					state <= JUDGE_READ_HIT;
				end

				WAIT_LSU_WVALID:
				begin
					if(s_axi_data_wvalid) begin
						state <= JUDGE_WRITE_HIT;
					end
				end
				
				WAIT_LSU_AWVALID:
				begin
					if(s_axi_data_awvalid) begin
						state <= JUDGE_WRITE_HIT;
					end
				end

				JUDGE_WRITE_HIT:
				begin
					if(hit) begin //hit
						tag_wen <= 1'b0;

						line_byte_wen <= ({{28{1'b0}}, wstrb} << ({{10{1'b0}}, word_sel} << 2));
						line_in <= ({{224{1'b0}}, wdata} << ({{10{1'b0}}, word_sel} << 5));

						state <= WAIT_CACHE_WORD_WRITE;
					end
					else begin
						state <= WAIT_RAM_WREADY_AWREADY;
					end


				end

				WAIT_RAM_WREADY: 
				begin
					if(m_axi_ram_wready) begin
						state <= WAIT_RAM_BVALID;
					end

				end
				WAIT_RAM_AWREADY:
				begin
					if(m_axi_ram_awready) begin
						state <= WAIT_RAM_BVALID;
					end
				end
				
				WAIT_RAM_BVALID:
				begin
					if(m_axi_ram_bvalid) begin
						if(s_axi_data_bready) begin
							state <= START;
						end
						else begin
							state <= WAIT_LSU_BREADY;
						end
					end

				end

				WAIT_LSU_BREADY:
				begin
					if(s_axi_data_bready) begin
						state <= START;
					end
				end

				WAIT_CACHE_WORD_WRITE:
				begin
					tag_wen <= 1'b0;
					line_byte_wen <= 0;

					line_in <= 0;
					state <= WAIT_RAM_WREADY_AWREADY;

				end

				WAIT_LSU_RREADY:
				begin
					if(s_axi_data_rready) begin
						state <= START;
					end
				end

				WAIT_RAM_WREADY_AWREADY:
				begin
					if(m_axi_ram_awready & m_axi_ram_wready) begin
						state <= WAIT_RAM_BVALID;
					end
					else begin
						if(m_axi_ram_awready) begin
							state <= WAIT_RAM_WREADY;
						end


						if(m_axi_ram_wready) begin
							state <= WAIT_RAM_AWREADY;
						end

					end
				end

				WAIT_RAM_ARREADY:
				begin
					if(m_axi_ram_arready & m_axi_ram_arvalid) begin
						state <= WAIT_RAM_RVALID;
					end
				end
			endcase
		end
	end	

	//RAM interface
	assign m_axi_ram_awaddr = addr & ~32'd7; // 8 Bytes aligned
	assign m_axi_ram_awregion = 4'b0;
	assign m_axi_ram_awlen = 8'b0;//write onece
	assign m_axi_ram_awsize = 3'b011; //8 Bytes
	assign m_axi_ram_awburst = 2'b01;
	assign m_axi_ram_awlock = 1'b0;
	assign m_axi_ram_awcache = 4'b0;
	assign m_axi_ram_awprot = 3'b0;
	assign m_axi_ram_awqos = 4'b0;
	assign m_axi_ram_awvalid = (state == WAIT_RAM_WREADY_AWREADY) | (state == WAIT_RAM_AWREADY);

	//write data channel
	assign m_axi_ram_wdata = {32'b0, wdata} << (addr[2] ? 32 : 0);
	assign m_axi_ram_wstrb = {4'b0, wstrb} << (addr[2] ? 4 : 0);
	assign m_axi_ram_wlast = (state == WAIT_RAM_WREADY_AWREADY) | (state == WAIT_RAM_WREADY);
	assign m_axi_ram_wvalid = (state == WAIT_RAM_WREADY_AWREADY) | (state == WAIT_RAM_WREADY);

	//write response channel
	assign m_axi_ram_bready = 1'b1;

	//read address channel
	assign m_axi_ram_araddr = (addr & ~(2 ** (WORD_INDEX_WIDTH + 2) - 1));
	assign m_axi_ram_arregion = 4'b0;
	assign m_axi_ram_arlen = 8'b0000_0011; //8B * 4
	assign m_axi_ram_arsize = 3'b011; //8 bytes
	assign m_axi_ram_arburst = 2'b01; //INCR type
	assign m_axi_ram_arlock = 1'b0;
	assign m_axi_ram_arcache = 4'b0;
	assign m_axi_ram_arprot = 3'b0;
	assign m_axi_ram_arqos = 4'b0;
	assign m_axi_ram_arvalid = ((state == JUDGE_READ_HIT) & !hit) | (state == WAIT_RAM_ARREADY);

	//read response channel
	assign m_axi_ram_rready = 1'b1;

	//LSU interface
	assign s_axi_data_arready = 1'b1;
	assign s_axi_data_rvalid = (hit & (state == JUDGE_READ_HIT)) | (state == WAIT_LSU_RREADY);
	assign s_axi_data_rdata = line_out[32 * word_sel +: 32];
	assign s_axi_data_rresp = 2'b0;

	assign s_axi_data_awready = 1'b1;
	assign s_axi_data_wready = 1'b1;
	assign s_axi_data_bresp = 2'b0;
	assign s_axi_data_bvalid = ((state == WAIT_RAM_BVALID) & m_axi_ram_bvalid) | (state == WAIT_LSU_BREADY);


	assign r_access = (state == START) & s_axi_data_arvalid;
	assign w_access = (state == START) & (s_axi_data_awvalid | s_axi_data_wvalid);
	
	assign r_miss = (state == JUDGE_READ_HIT) & !hit;
	assign w_miss = (state == JUDGE_WRITE_HIT) & !hit;

`else
	//TODO: without cache

`endif

endmodule
