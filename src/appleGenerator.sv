module appleGenerator (
	// Current tail segemnts
	input logic [15:0][15:0] tail,
	
	// random generator
	input logic [7:0] randNum,
	// clock, reset
	input logic clk, rst, gen,
	
	// location of apple, 7:4 is y coord 3:0 is x coordinate
	output logic [7:0] apple
	);
		
	enum logic {NEW, SAME} ps, ns;
	
	always_comb
		if (ps == SAME)
			if (gen)
				ns = NEW;
			else	
				ns = ps;
		else
			if (tail[apple[7:4]][apple[3:0]])
				ns = ps;
			else
				ns = SAME;
				
	
	always_ff @(posedge clk)
	if (rst) begin
		ps <= NEW;
		apple <= randNum;
	end else if (ns == NEW) begin
		apple <= randNum;
		ps <= ns;
	end else
		ps <= ns;
	
	
endmodule //appleGenerator