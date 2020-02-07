/* record bit in excepttype, priority*/
`define  bit_Int0  		0
`define  bit_Int1  		1
`define  bit_Int2  		2
`define  bit_Int3  		3
`define  bit_Int4  		4
`define  bit_Int5  		5
`define  bit_Int6  		6
`define  bit_Int7  		7
`define  bit_AdEL_if  	8
`define  bit_Sys  		9
`define  bit_Ri  		10
`define  bit_Ov  		11
`define  bit_Tr  		12
`define  bit_Bp  		13
`define  bit_AdEL_ld  	14
`define  bit_AdES  		15
`define  bit_eret  		16


/* encode in IEH, used in cp0 & cu*/
`define  encode_None  		32'h0
`define  encode_Int0  		32'h1
`define  encode_Int1  		32'h2
`define  encode_Int2  		32'h3
`define  encode_Int3  		32'h4
`define  encode_Int4  		32'h5
`define  encode_Int5  		32'h6
`define  encode_Int6  		32'h7
`define  encode_Int7  		32'h8
`define  encode_AdEL_if  	32'h9
`define  encode_Sys  		32'ha
`define  encode_Ri  		32'hb
`define  encode_Ov  		32'hc
`define  encode_Tr  		32'hd
`define  encode_Bp  		32'he
`define  encode_AdEL_ld  	32'hf
`define  encode_AdES  		32'h10
`define  encode_eret  		32'h11

/* CP0 Cause Register ExcCode */
`define  Exc_Int 			4'h0
`define  Exc_AdEL 			4'h4
`define  Exc_AdES 			4'h5
`define  Exc_Sys 			4'h8
`define  Exc_Bp 			4'h9
`define  Exc_Ri 			4'ha
`define  Exc_Ov 			4'hc
`define  Exc_Tr 			4'hd

