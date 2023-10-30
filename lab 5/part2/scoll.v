module scroll(
  input clk,
  input rst,
  output [15:0] display
);

	reg [3:0] count;
    wire [3:0] a, b, c, d;

	always @(posedge clk)
	begin
     if (rst)
       count <= 4'd0;
     else
       count <= count + 1'b1;
      end

    assign a = count;
    assign b = count + 2'b01;
    assign c = count + 2'b10;
    assign d = count + 2'b11;

      // instantiate convert module for each letter to 
        convert bitA(.in(a), .out(display[15:12]));
        convert bitB(.in(b), .out(display[11:8]));
        convert bitC(.in(c), .out(display[7:4]));
        convert bitD(.in(d), .out(display[3:0]));

endmodule