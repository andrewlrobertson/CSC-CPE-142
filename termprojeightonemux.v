module eightonemux(input [15:0] a,b,c,d,e,f,g,h,
				  input [2:0] sel,
				  output reg [15:0] y);
				  
always @*
	begin
		case (sel)
			3'd0 :  y = a;
			3'd1 :  y = b;
			3'd2 :  y = c;
			3'd3 :  y = d;
			3'd4 :  y = e;
			3'd5 :  y = f;
			3'd6 :  y = g;
			3'd7 :  y = h;
		endcase
	end
	
endmodule