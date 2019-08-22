module signext #(parameter SIZE = 8)(input [SIZE-1:0] a,
				 output reg [15:0] y);
				  
always @*
	begin
		if(a[SIZE-1] == 1'b0)
		y = {{16-SIZE{1'b0}},a};
		else
		y = {{16-SIZE{1'b1}},a};
	end
endmodule