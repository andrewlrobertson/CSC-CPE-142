module pathcontrol(input [3:0] opcode, functcode,
		   output reg [13:0] control);

	always@*
	begin
		case (opcode)
			4'd0 :
				begin
				  if (functcode == 4'b0000) control = 14'b11011111000010;       //add
				  else if (functcode == 4'b0001) control = 14'b11011111001010;  //sub
				  else if (functcode == 4'b0100) control = 14'b10011111010011;  //mul
				  else if (functcode == 4'b1000) control = 14'b10011111011011;  //div
				  else if (functcode == 4'b1110) control = 14'b11011111111011;  //mv
				  else if (functcode == 4'b1111) control = 14'b10011111100010;  //swp
				  else control = 14'bxxxxxxxxxxxxxx;
				end
			4'd1 :
        control = 14'b11011111101101;       //andi
			4'd2 :
        control = 14'b11011111110101;       //ori
			4'd8 :
        control = 14'b11011111000010;       //lbu
			4'd9 :
        control = 14'b11110000000011;       //sb
			4'd10 :
        control = 14'b01011100000011;       //lw
			4'd11 :
        control = 14'b11111000000011;       //sw
			4'd4 :
        control = 14'b11101111001001;       //blt
			4'd5 :
        control = 14'b11101111001001;       //bgt
			4'd6 :
        control = 14'b11101111001001;       //beq
			4'd12 :
        control = 14'b11011111000010;       //jmp
			4'd15 :
        control = 14'b11111111111111;       //halt
			default:
				control = 14'bxxxxxxxxxxxxxx;
		endcase
	end
endmodule