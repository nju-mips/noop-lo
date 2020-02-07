module reg_w_gen (
	input of,
	input zf,
	input idex_movz,
	input idex_movnz,
	input idex_reg_w,
	input idex_of_w_disen,
	output new_reg_w
);

assign new_reg_w = ((idex_movz && !zf) || (idex_movnz && zf) || (idex_of_w_disen && of)) ? 0 : idex_reg_w;

endmodule