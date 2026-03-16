module direction_tb ();
  	logic rst, clk, enable, L, R;
	logic[1:0] dir;

  direction dut (.*);


  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    repeat(100) #(CLOCK_PERIOD/2) clk <= ~clk;
  end

  
  initial begin
    {rst, enable, L, R} <= 4'b1000;	@(posedge clk);
	 rst <= 0;								@(posedge clk);
	 L <= 1;									@(posedge clk);
	 enable <= 1;							@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
	 R <= 1;									@(posedge clk);
												@(posedge clk);
	 L <= 0;									@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
												@(posedge clk);
	$stop;

  end
endmodule  // direction_tb