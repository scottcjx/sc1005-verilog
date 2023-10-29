
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
            assign b = count + 1;
            assign c = count + 2;
            assign d = count + 3;

            if (a > 15) assign a = a - 15;
            if (b > 15) assign b = b - 15;
            if (c > 15) assign c = c - 15;
            if (d > 15) assign d = d - 15;

	end


endmodule