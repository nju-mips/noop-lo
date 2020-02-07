
`ifndef __FLUSH_VH__
`define __FLUSH_VH__
// msg:
//      kind 2
//      branch_id 6 

`define FLUSH_KIND_BIT 2
`define BRANCH_ID_BIT  6

// kind
`define no_flush      2'b00
`define flush_no_cond 2'b01
`define flush_cond    2'b10

`define flush_judge(result, fkind, isds, bid, fbid) \
always@(*) begin \
    case(fkind) \
        `no_flush: result = 1'b0; \
		`flush_no_cond: result = 1'b1; \
		`flush_cond: begin \
            if(isds == 1'b1) \
				result = (bid != fbid); \
			else \
				result = 1'b1; \
		end \
		default: result = 1'b0; \
	endcase \
end


`endif /* __FLUSH_VH__ */
