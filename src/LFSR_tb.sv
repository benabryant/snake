// Testbench for a LFSR
module LFSR_tb ();
  logic clk, rst;
  logic state;
  logic [7:0] in;
  logic [7:0] out;
  
  assign state = (out == 8'b00101011);

  LFSR dut(.*);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end
  
  integer i;
  initial begin
    rst <= 1; in <= 8'b11111111;		 @(posedge clk);
	 rst <= 0; 							 	@(posedge clk);
	 in <= 8'b00101011;					@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk); // No change in state, should be stuck
	 rst <= 1;								@(posedge clk);
	 rst <= 0;								@(posedge clk);
	 
	 for (i = 0; i < 256; i++) begin
		@(posedge clk);
	 end
	 
	 $stop;
  end
endmodule  // LFSR_tb