module zeroext #(parameter SIZE = 8)(input [SIZE-1:0] a,
				 output reg [15:0] y);
				  
always @*
	y = {{16-SIZE{1'b0}},a};
endmodule