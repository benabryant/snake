module LFSR (

 output logic [7:0] out,  			// present state
 
 input  logic clk, rst,          // clock and reset input
 
 input logic [7:0] in
 );
 
 always_ff @(posedge clk)
	if (rst) 
		out <= in;
	else
		out <= {out[6:0], ~((out[3] ^ out[4]) ^ (out[5] ^ out[7]))};
 endmodule // LFSR