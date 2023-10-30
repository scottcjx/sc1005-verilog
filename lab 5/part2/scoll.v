
module scroll(
    input clk,
    input rst,
    output display[15:0]
);

	reg [15:0] count;
    wire [3:0] a, b, c, d;

	always @(posedge clk)
	begin
         if (rst) 
             count <= 15'd0;
         else
             count <= count + 1'b1;

            assign a = count;
            assign b = count + 2'b01;
            assign c = count + 2'b10;
            assign d = count + 2'b11;

            // need check if will oflow, if oflow then need to correct.
            // if (a > 4'hF) assign a = a - 4'hF;
            // if (b > 4'hF) assign b = b - 4'hF;
            // if (c > 4'hF) assign c = c - 4'hF;
            // if (d > 4'hF) assign d = d - 4'hF;

            // part 2 step 6 -> instantiate convert module for each letter to display.
            convert bitA(.in(a), .out(display[3:0]));
            convert bitB(.in(b), .out(display[7:4]));
            convert bitC(.in(c), .out(display[]));
            convert bitD(.in(d), .out(display[d]));
	end


endmodule