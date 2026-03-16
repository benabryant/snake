module light_tb ();
   logic clk, rst, enable, turnOn, eat;
	logic[7:0] stage, goal;
	logic tail, lose;

  // Instantiate the device under test (DUT)
  light dut (.*);
  countTo helper(.clk, .rst, .enable, .goal, .cur(stage));

  // Clock generation: 100ns period
  parameter CLOCK_PERIOD = 100;
  initial begin
    clk <= 0;
    repeat (600) #(CLOCK_PERIOD / 2) clk <= ~clk;
  end

  initial begin
	 rst <= 1; turnOn <= 0; eat <= 0; 				@(posedge clk); 
    rst <= 0; enable <= 1; goal <= 8'b00000100;	@(posedge clk);
	 eat <= 1;												@(posedge clk);
	 eat <= 0;												@(posedge clk);
	 turnOn <= 1;											@(posedge clk);
	 turnOn <= 0;											@(posedge clk);
																@(posedge clk);
	 eat <= 1;												@(posedge clk);
	 eat <= 0;												@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
																@(posedge clk);
	 turnOn <= 1;											@(posedge clk);
															   @(posedge clk);
	 rst <= 1;												@(posedge clk);
	 rst <= 0;												@(posedge clk);
	 turnOn <= 1;											@(posedge clk);
	 turnOn <= 0;											@(posedge clk);
																@(posedge clk);
	 turnOn <= 1;											@(posedge clk);
	 eat <= 0;												@(posedge clk);
																@(posedge clk);
																@(posedge clk);
		
	 
   $stop;  // Stop the simulation
  end

endmodule  // light_tb