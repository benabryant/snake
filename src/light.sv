module light (
	input logic clk, rst, enable, turnOn, eat,
	input logic[7:0] stage,
	output logic tail, lose
);

	reg [7:0] pn, nn;


	enum logic {ON = 1'b1, OFF = 1'b0} ps, ns;


	always_comb begin
		nn = pn;
		if (~enable) begin
			ns = ps; 
		end else if (turnOn) begin
				ns = ON;
				nn = stage; 
		end else begin
			if (eat && pn >= stage) begin
				ns = ps;
				nn = pn + 1'b1; 
			end else if (pn == stage)
				ns = OFF;
			else
				ns = ps;
		end
	end

	assign tail = (ns == ON);
	assign lose = (ps == ON & turnOn);


	always_ff @(posedge clk) begin
		if (rst) begin
			ps <= OFF;
			pn <= '0;
		end else begin
			ps <= ns;
			pn <= nn;
		end
	end
endmodule  // light