module snake(
		input logic clk, rst, GAME_CLOCK, KEY0, KEY3,
		input logic [7:0] SW,
		output logic[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
		output logic[15:0][15:0] RedPixels, GrnPixels
	);
	
	logic L, R, eat, loss, resetGame;
	logic[1:0] dir;
	logic[7:0] apple, head, randNum, counter, stage, highScore;
	logic[15:0][15:0] tail;
	logic[255:0] lose;
	
	assign resetGame = loss | rst;
	
	userInput left (.clk, .rst, .in(KEY3), .enable(GAME_CLOCK), .out(L));
	userInput right (.clk, .rst, .in(KEY0), .enable(GAME_CLOCK), .out(R));
	
	direction compass (.rst(resetGame), .clk, .enable(GAME_CLOCK), .L, .R, .dir);
	
	display score (.rst(resetGame), .clk, .enable(GAME_CLOCK), .score(eat), .HEX0, .HEX1, .HEX2, .counter);
	display hScore (.rst, .clk, .enable(GAME_CLOCK), .score(highScore < counter), .HEX0(HEX3), .HEX1(HEX4), .HEX2(HEX5), .counter(highScore));
	
	LFSR ran (.out(randNum), .clk, .rst, .in(SW[7:0]));
	appleGenerator gen (.tail, .randNum, .clk, .rst(resetGame), .gen(eat), .apple);
	
	countTo count(.clk, .rst(resetGame), .enable(GAME_CLOCK), .goal(counter - 2'b10), .cur(stage));
	
	headGenerator heading (.clk, .rst(resetGame), .enable(GAME_CLOCK), .apple, .dir, .eat, .head);
	
	genvar i, j;
   generate
        for (i = 0; i < 16; i = i + 1) begin : row
            for (j = 0; j < 16; j = j + 1) begin : col
                light tailLight (.clk, 
					 .rst(resetGame), 
					 .enable(GAME_CLOCK),
					 .turnOn(head == {i[3:0], j[3:0]}), 
					 .eat,
					 .stage,
					 .tail(tail[i[3:0]][j[3:0]]),
					 .lose(lose[i * 16 + j])      
                );
					 assign RedPixels[i][j] = (apple == {i[3:0], j[3:0]}) | tail[i][j];
					 assign GrnPixels[i][j] = (head == {i[3:0], j[3:0]}) | tail[i][j];
            end
        end
    endgenerate
	 
	 assign loss = |lose;

	
endmodule //snake