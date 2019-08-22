module fouronemux(input [15:0] a,b,c,d, 
				  input [1:0] sel, 
				  output reg [15:0] y);
				  
always @*
	begin
		case (sel)
			2'd0 :  y = a;
			2'd1 :  y = b;
			2'd2 :  y = c;
			2'd3 :  y = d;
		endcase
	end
	
endmodule