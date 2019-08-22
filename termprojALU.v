module ALU(input signed [15:0] a, b, 
           input [2:0] s, 
		   output reg signed [15:0] yhigh, ylow, 
		   output reg n,z);

	always@*
	begin
		case (s)
			3'd0 : 
				begin
				yhigh = 16'd0;
				ylow = a + b;
				end
			3'd1 : 
				begin
				yhigh = 16'd0;
				ylow = a - b;
				end
			3'd2 : 
				{yhigh,ylow} = a*b;
			3'd3 : 
				begin
				yhigh = a % b;
				ylow = a / b;
				end
			3'd4 : 
				begin
				ylow = b;
				yhigh = a;
				end
			3'd5 : 
				begin
				yhigh = 16'd0;
				ylow = a & b;
				end
			3'd6 : 
				begin
				yhigh = 16'd0;
				ylow = a | b;
				end
			3'd7 : 
				begin
				yhigh = 16'd0;
				ylow = b;
				end
		endcase
		
		if (yhigh==16'd0 && ylow==16'd0) z=1'b0;		//active low
		else z=1'b1;
		
		if (ylow<0) n=1'b0;							//active low
		else n=1'b1;
		
	end
endmodule