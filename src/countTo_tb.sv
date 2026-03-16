module countTo_tb();
	logic clk, rst, enable;
	logic[7:0] goal, cur;
	logic state;
	
	assign state = (cur == '0);
	
  countTo dut (.*);
	
  // Set up the clock
  parameter CLOCK_PERIOD=100;
  initial begin
    clk <= 0;
    forever #(CLOCK_PERIOD/2) clk <= ~clk;
  end
  
  integer i;
  initial begin
    rst <= 1; enable <= 0; goal <= '0;	@(posedge clk);@(posedge clk);
	 rst <= 0; goal <= 8'b000000010;	   @(posedge clk);
													@(posedge clk);
	 enable <= 1;								@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
	 goal <= 8'b000000100;	   			@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
	 goal <= 8'b111111111;	   			@(posedge clk);
	 for (i = 0; i < 256; i++) begin
		@(posedge clk);
	 end
	 $stop;
	end


endmodule //countTo_tb