module counter_tb();
	logic clk, rst;
	logic fast;
	logic out;
	
  counter dut (.*);
	
  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end
  
  integer i, j;
  initial begin
    rst <= 1; 				
	 @(posedge clk);@(posedge clk);@(posedge clk);
	 rst <= 0; fast <= 0;@(posedge clk);
	 for (i = 0; i < 1024; i++) begin
		@(posedge clk);
	 end
	 fast <= 1; @(posedge clk);
	 for (j = 0; j < 512; j++) begin
		@(posedge clk);
	 end
	 @(posedge clk);
	 $stop;
	end


endmodule //counter_tb