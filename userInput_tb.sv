// Testbench for a user input stabilizer, DFF and edge detector
module userInput_tb ();
  logic clk, rst, in, out, enable;

  userInput dut (.*);

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    repeat(100) #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  
  initial begin
    {rst, in} <= 3'b100;	@(posedge clk);
	 rst <= 0; enable <= 1;	@(posedge clk);
									#(CLOCK_PERIOD/5);
	 in <= 1;					#(CLOCK_PERIOD/3);
	 in <= 0;					#(CLOCK_PERIOD);
	 in <= 1;					#((CLOCK_PERIOD/4)*3); 
	 in <= 0;					@(posedge clk);
	 in <= 1;					@(posedge clk);
	 enable <= 0;				@(posedge clk);
	 in <= 0;					@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
	 in <= 1; enable <= 1;	@(posedge clk);
									@(posedge clk);
	 in <= 0;					@(posedge clk);
	 in <= 1;					@(posedge clk);
	 rst <= 1; in<= 0;		@(posedge clk); 
	 rst <= 0;					@(posedge clk);
	 enable <= 0;				@(posedge clk);
	 in <= 1;					@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
	 $stop;
  end
endmodule  // userInput_tb