`include "axi.vh"

module performance_counter (
	input clk,
	input rst,

	input icache_access,
	input icache_miss,
	
	input load,
	input store,
	
    input [63 : 0] load_cycles,
    input [63 : 0] store_cycles,
    
    input mul,
    input div,
    
    input dcache_r_access,
    input dcache_w_access,
    input dcache_r_miss,
    input dcache_w_miss,
    
    input [63 : 0] dcache_r_miss_cycles,

	`axilite_slave_if(s_axi_counter)
);

	
	reg [31 : 0] counter_set [31 : 0];

	reg [31 : 0] araddr;

	parameter IDLE = 0, WAIT_RREADY = 1;
	reg [1 : 0] state;

	always @(posedge clk) begin
		if(rst) begin
			araddr <= 0;
			
			{counter_set[1], counter_set[0]} <= 0; //icache access
			{counter_set[3], counter_set[2]} <= 0; //icache miss
			{counter_set[5], counter_set[4]} <= 0; //load
			{counter_set[7], counter_set[6]} <= 0; //store
			
			{counter_set[13], counter_set[12]} <= 0; //total cycles
			{counter_set[15], counter_set[14]} <= 0; //load cycles
            {counter_set[17], counter_set[16]} <= 0; //store cycles
            {counter_set[19], counter_set[18]} <= 0; //mul
            {counter_set[21], counter_set[20]} <= 0; //div
            {counter_set[23], counter_set[22]} <= 0; //dcache read access
            {counter_set[25], counter_set[24]} <= 0; //dcache write access
            {counter_set[27], counter_set[26]} <= 0; //dcache read miss
            {counter_set[29], counter_set[28]} <= 0; //dcache write miss
            {counter_set[31], counter_set[30]} <= 0;
			state <= IDLE;
		end
		else begin
		    if(icache_access) begin
		      {counter_set[1], counter_set[0]} <= {counter_set[1], counter_set[0]} + 1;
		    end
		    
		    if(icache_miss) begin
		      {counter_set[3], counter_set[2]} <= {counter_set[3], counter_set[2]} + 1;
		    end
		    
		    if(load) begin
		      {counter_set[5], counter_set[4]} <= {counter_set[5], counter_set[4]} + 1;
		    end
		    
		    if(store) begin
		      {counter_set[7], counter_set[6]} <= {counter_set[7], counter_set[6]} + 1;
		    end
		    
		    {counter_set[13], counter_set[12]} <=  {counter_set[13], counter_set[12]}  + 1;
		    {counter_set[15], counter_set[14]} <= load_cycles;
		    {counter_set[17], counter_set[16]} <= store_cycles;
		    
		    if(mul) begin
		      {counter_set[19], counter_set[18]} <= {counter_set[19], counter_set[18]} + 1;
		    end
		    
		    if(div) begin
		      {counter_set[21], counter_set[20]} <= {counter_set[21], counter_set[20]} + 1;
		    end
		    
		    if(dcache_r_access) begin
		      {counter_set[23], counter_set[22]} <= {counter_set[23], counter_set[22]} + 1;
		    end
		    
		    if(dcache_w_access) begin
		      {counter_set[25], counter_set[24]} <= {counter_set[25], counter_set[24]} + 1;
		    end
		    
		    if(dcache_r_miss) begin
		      {counter_set[27], counter_set[26]} <= {counter_set[27], counter_set[26]} + 1;
		    end
		    
		    if(dcache_w_miss) begin
		      {counter_set[29], counter_set[28]} <= {counter_set[29], counter_set[28]} + 1;
		    end
		    
		    {counter_set[31], counter_set[30]} <= dcache_r_miss_cycles;
		    
			case(state)
				IDLE: 
					begin
						if(s_axi_counter_arvalid) begin
							araddr <= s_axi_counter_araddr;
							state <= WAIT_RREADY;
						end
					end
				WAIT_RREADY:
					begin
						araddr <= araddr;
						if(s_axi_counter_rready) begin
						     state <= IDLE;
						end
					end
			endcase
		end
	end


	wire [4 : 0] offset = araddr[6 : 2];


	assign s_axi_counter_arready = (state == IDLE);
	assign s_axi_counter_rvalid = (state == WAIT_RREADY);      
	assign s_axi_counter_rdata = counter_set[offset]; 
	assign s_axi_counter_rresp = 2'b0;

	assign s_axi_counter_awready = 1'b0;
	assign s_axi_counter_wready = 1'b0;
    assign s_axi_counter_bresp = 2'b0;
	assign s_axi_counter_bvalid = 1'b0;
endmodule
