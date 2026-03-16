module display(
	input logic rst, clk, enable, score, 
	output logic[6:0] HEX0, HEX1, HEX2,
	output logic[7:0] counter
	);
	
	
	seg7 zero(.num(counter % 10), .HEX(HEX0));
	seg7 one(.num((counter / 10) % 10), .HEX(HEX1));
	seg7 two(.num(counter / 100), .HEX(HEX2));
	

	always_ff @(posedge clk)
	if (rst)
		counter <= 8'b00000011;
	else if (enable & score)
		counter <= counter + 1'b1;
	
endmodule //display