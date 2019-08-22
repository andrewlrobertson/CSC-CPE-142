module adder(input signed [15:0] a,b,
				 output reg signed [15:0] y);
				  
always @*
	y = a+b;
endmodule