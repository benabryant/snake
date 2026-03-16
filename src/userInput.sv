module userInput (
	input logic clk, rst, in, enable,
	output logic out
	);

  logic mid, last; // Last reresents the output of a DFF
  enum logic {ZERO, ONE} ps = ZERO, ns; //After input is run through the DFF it affects state
  
  always_comb
	if (enable)
		ns = last ? ONE : ZERO; 
	else
		ns = ps; // Turns on when not enabled but only can turn off when enabled
  
  assign out = (ps == ONE);
  
  always_ff @(posedge clk)
    if (rst)
		begin
			{mid, last} <= 2'b00;
			ps <= ZERO;
		end
    else
		begin
			{mid, last} <= {in, mid};
			ps <= ns;
		end
  
  
  
  
  
 endmodule  // userInput
