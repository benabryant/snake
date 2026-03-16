module countTo (
	input logic clk, rst, enable, 
	input logic[7:0] goal,
	output logic[7:0] cur
	);
	
	reg[7:0] ps = '0, ns;
	
	always_comb
		if (~enable)
			ns = ps;
		else
			ns = (ps == goal)? '0 : ps + 1'b1;
	
	assign cur = ns;

	
	always_ff @(posedge clk)
		if (rst)
			ps <= '0;
		else
			ps <= ns;	
	
endmodule //countTo