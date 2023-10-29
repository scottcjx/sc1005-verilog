module vsevenseg(
    input [3:0] x,
    output reg [6:0] seg_L
    );
   
    always @ *
     begin
        case (x)
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