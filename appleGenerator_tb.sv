// Testbench for apple generator
module appleGenerator_tb ();
  logic clk, rst, gen;
  
  logic [7:0] in, out;
  
	// Current tail segemnts
	logic [15:0][15:0] tail;
		
	// location of apple, 7:4 is y coord 3:0 is x coordinate
	logic [7:0] apple;

  LFSR generator(.*);
  
  appleGenerator dut (.clk, .rst, .gen, .tail, .apple, .randNum(out));

  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end
  
  initial begin
    rst <= 1; in <= 8'b00101011; gen <= 0; tail <= '0;
							@(posedge clk);
							@(posedge clk);
	 rst <= 0; 			@(posedge clk);
	 tail[8:0] <= '1;	@(posedge clk); // Simply set half of tail pieces to 1 to see where apple generates
							@(posedge clk);
							@(posedge clk);
	 gen <= 1;			@(posedge clk);
	 gen <= 0;			@(posedge clk);
	 						@(posedge clk);
							@(posedge clk);				
	 gen <= 1;			@(posedge clk);
							@(posedge clk);
	 gen <= 0;			@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
	 rst <= 1;			@(posedge clk);
	 rst <= 0;gen <= 1;@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
							@(posedge clk);
	 
	 $stop;
  end
endmodule  // appleGenerator_tb