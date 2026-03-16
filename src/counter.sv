module counter (
	input logic clk, rst, 
	input logic fast,
	output logic out
	);
	
	logic[9:0] cur;
	
	assign out = (cur == '0);
	
	always_ff @(posedge clk)
		if (rst)
			cur <= '0;
		else if (fast & cur == 10'b0111111111)
			cur <= '0;
		else
			cur <= cur + 1'b1;

endmodule // counter	