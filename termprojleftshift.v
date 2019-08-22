module leftshift(input [15:0] a,
				 output reg [15:0] y);
				  
always @*
	y = {a[13:0],2'b0};
endmodule