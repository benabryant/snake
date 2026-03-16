module direction(
	input logic rst, clk, enable, L, R,
	output logic[1:0] dir
	);
	
	enum logic[1:0] {N = 2'b11, E = 2'b01, S = 2'b00, W = 2'b10} ns, ps;
	
	always_comb
		if (~enable | L == R)
			ns = ps;
		else if (R)
			case (ps)
				N: ns = W;
				E: ns = N;
				S: ns = E;
				default: ns = S;
			endcase
		else 
			case (ps)
				N: ns = E;
				E: ns = S;
				S: ns = W;
				default: ns = N;
			endcase
				
	assign dir = ns;
				
	always_ff @(posedge clk)
		if (rst)
			ps <= N;
		else 
			ps <= ns; 
		
	
endmodule // direction