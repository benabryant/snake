module display_tb();
	logic rst, clk, enable, score;
	logic[6:0] HEX0, HEX1, HEX2;
	logic[7:0] counter;
	
	display dut (.*);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end
  
  integer i;
  initial begin
    rst <= 1; enable <= 0; score <= 0;	@(posedge clk);
	 rst <= 0; 							 		@(posedge clk);
	 score <= 1;								@(posedge clk);
	 enable <= 1;								@(posedge clk);
	 score <= 0;								@(posedge clk);
													@(posedge clk);
	 enable <= 1;score <= 1;				@(posedge clk);
	 
	 for (i = 0; i < 400; i++) begin
		@(posedge clk);
	 end
	 $stop;
  end
 endmodule //display_tb