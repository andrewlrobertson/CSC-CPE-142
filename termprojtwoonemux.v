module twoonemux #(parameter SIZE = 16) (input [SIZE-1:0] a,b, 
				  input sel, 
				  output reg [SIZE-1:0] y);
				  
always @*
	begin
		case (sel)
			1'd1 :  y = b;
			default : y = a;
		endcase
	end
	
endmodule