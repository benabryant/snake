module snake_tb();
	logic clk, rst, GAME_CLOCK, KEY0, KEY3;
	logic [7:0] SW;
	logic[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	logic[15:0][15:0] RedPixels, GrnPixels;
	

	snake dut (.*);


	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
		GAME_CLOCK <= 0;
		forever begin
			GAME_CLOCK <= 1; 	@(posedge clk);
			GAME_CLOCK <= 0; 	@(posedge clk); 
									@(posedge clk);
								   @(posedge clk);
									@(posedge clk);
		end
	end

  
	  initial begin
		rst <= 1; KEY0 <= 0; KEY3 <= 0; SW[7:0] <= 8'b00000000;
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
		rst <= 0;			@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
		KEY0 <= 1;			@(posedge GAME_CLOCK);
		KEY0 <= 0;			@(posedge GAME_CLOCK);
		KEY3 <= 1;			@(posedge GAME_CLOCK);
		KEY3 <= 0;			@(posedge GAME_CLOCK);
		KEY0 <= 1;			@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK); //loss
								@(posedge GAME_CLOCK);
								@(posedge GAME_CLOCK);
		

		$stop;
	end
	
endmodule //snake_tb