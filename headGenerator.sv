module headGenerator (
	input logic clk, rst, enable,
	input logic[7:0] apple,
	input logic[1:0] dir,
	output logic eat,
	output logic[7:0] head
	);

	enum logic {SCH = 1'b0, EAT = 1'b1} ns, ps;
	reg[7:0] pn, nn;
	
	always_comb begin
		if (~enable)
			ns = ps;
		else if (apple == head)
			ns = EAT;
		else
			ns = SCH;
			
	if (~enable)
		nn = pn;
	else
		case (dir)
			 2'b11: 	nn = {pn[7:4] - 1'b1, pn[3:0]}; 
			 2'b01: 	nn = {pn[7:4], pn[3:0] - 1'b1}; 
			 2'b00: 	nn = {pn[7:4] + 1'b1, pn[3:0]}; 
			 default:nn = {pn[7:4], pn[3:0] + 1'b1}; 
		endcase
	end

	assign eat = (ns == EAT);
	assign head = pn;
	
	
	always_ff @(posedge clk)
		if (rst) begin
			ps <= SCH;
			pn <= 8'b10001000;
		end
		else begin
			ps <= ns;
			pn <= nn;
		end

endmodule //headGenerator