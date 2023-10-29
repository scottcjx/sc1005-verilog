module vaddoflow(
    input [3:0] a,
    input [3:0] b,
    output [6:0] seg_L,
    output [4:4] oflow
    );
   
    wire [4:0] x;
   
    assign x = a + b;
   
    vsevenseg part1 (.x(x[3:0]), .seg_L(seg_L));
   
    assign oflow = x[4];
   
endmodule