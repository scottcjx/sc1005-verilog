module segtoggle(
    input [3:0] a,
    input [3:0] b,
    input clk,
    input rst,
    input sel,
    output reg [6:0] seg_L,
    output reg [3:0] anode_L    // needed to select the correct 7 seg display
    );
    
    wire [1:0] seg7_clk;
    wire [7:0] x, res;
    
      reg [19:0] count;      
    reg [3:0] selnum;

    // This always block and the following assign statement generate
    //      The Two bit SLOW clock, from the 100MHz system clock (clk) for the 7 seg anodes
    always@(posedge(clk))
         if (rst)        // rst is the middle push button
              count <= 20'b0;
         else
              count <= count+1'b1;
              
      assign seg7_clk = count[19:18];       // select the 2 MSBs to drive the 7 seg anodes
      assign x = (sel) ? {benchNo_10, benchNo_1} : res;
      
      // This always block generates
      //     1. The value displayed on each 7-seg display (selnum[3:0])         
      //     2. The one-hot active low 7 seg display anode select signals (anode_L[3:0]
    always @ *          
    begin
        anode_L=4'b1111;       // all off
        case (seg7_clk)    
                  2'd0 :  begin
                        anode_L=4'b1110;
                        selnum = x[3:0];
                    end
                  2'd1 :  begin
                        anode_L=4'b1101;
                        selnum = x[7:4];
                    end
                  2'd2 :  begin
                        //anode_L=4'b1011;
                        anode_L=4'b1111;    // all off
                        selnum = 4'd0;
                    end
                  2'd3 :  begin
                        //anode_L=4'b0111;
                        anode_L=4'b1111;    // all off
                        selnum = 4'd0;
                    end
        endcase
    end

      

// **************** Do NOT modify the code above ****************** //

// Enter your Bench Number here. If required, add the offset given
    wire [3:0] benchNo_10 = 4'd1;  // Enter the tens digit of YOUR bench number
    wire [3:0] benchNo_1 = 4'd0;   // Enter the ones digit of YOUR bench number

// Generate the 8-bit product of a and b
    assign res = a * b;   // generate the 8-bit product.

// COPY YOUR ALWAYS BLOCK HERE AND USE "selnum" AS THE CASE CONDITION

always @ *
     begin
        case (selnum)
        4'd0 : seg_L = 7'b 1000000;
        4'd1 : seg_L = 7'b 1111001;
        4'd2 : seg_L = 7'b 0100100;
        4'd3 : seg_L = 7'b 0110000;
        4'd4 : seg_L = 7'b 0011001;
        4'd5 : seg_L = 7'b 0010010;
        4'd6 : seg_L = 7'b 0000010;
        4'd7 : seg_L = 7'b 1111000;
        4'd8 : seg_L = 7'b 0000000;
        4'd9 : seg_L = 7'b 0010000;
        4'd10 : seg_L = 7'b 0001000;
        4'd11 : seg_L = 7'b 0000011;
        4'd12 : seg_L = 7'b 1000110;
        4'd13 : seg_L = 7'b 0100001;
        4'd14 : seg_L = 7'b 0000110;
        4'd15 : seg_L = 7'b 0001110;
       default: seg_L = 7'b1111111;
       endcase
    end
 
endmodule