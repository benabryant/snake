module headGenerator_tb();
	logic clk, rst, enable, loss;
	logic[7:0] apple;
	logic[1:0] dir;
	logic eat;
	logic[7:0] head;
	
	headGenerator dut (.*);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		enable <= 0;
		forever begin
			enable <= 1; 	@(posedge clk);
			enable <= 0; 	@(posedge clk); 
								@(posedge clk);
								@(posedge clk);
								@(posedge clk);
		end
	end

  
	  initial begin
		rst <= 1; apple <= 8'b10000000; dir <= 2'b01; loss <= 0;
								@(posedge enable);
								@(posedge enable);
		rst <= 0;			@(posedge enable);
								@(posedge enable);
								@(posedge enable);
								@(posedge enable);
								@(posedge enable);
								@(posedge enable);
								@(posedge enable);
								@(posedge enable);
		dir <= 2'b11;		@(posedge enable);
								@(posedge enable);
								@(posedge enable);
		loss <= 0;			@(posedge enable);
								@(posedge enable);


		$stop;
	end
	
endmodule //headGenerator_tb