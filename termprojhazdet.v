module hazdet(input [3:0] EXwriteAddr, DEop1Addr, DEop2Addr,
			  input EXreadbit, 
			  output reg fetchbuffenable, zerocontrol, pcenable);

reg test;			  
always @*
begin
if (!EXreadbit & ((EXwriteAddr == DEop1Addr) |
	     (EXwriteAddr == DEop2Addr))) test = 1'b1;
else test = 1'b0;
end

always@*
begin		 
case (test)
	1'b0:
	begin
		fetchbuffenable = 1'b0; 	//enable (active low) 
		zerocontrol  = 1'b0; 		//enable (active low)
		pcenable  = 1'b0; 			//enable (active low)
	end
	1'b1:
	begin
		fetchbuffenable = 1'b1; 	//disable (active low) 
		zerocontrol  = 1'b1; 		//disable (active low)
		pcenable  = 1'b1; 			//disable (active low)	
	end
	1'bx:
	begin
		fetchbuffenable = 1'b0; 	//enable (active low) 
		zerocontrol  = 1'b0; 		//enable (active low)
		pcenable  = 1'b0; 			//enable (active low)
	end	
endcase
end
	
endmodule

/*
module hazdet(input [3:0] EXwriteAddr, DEop1Addr, DEop2Addr,
			  input EXreadbit, 
			  output reg fetchbuffenable, zerocontrol, pcenable);
				  
always @*
begin
	if (!EXreadbit & ((EXwriteAddr == DEop1Addr) |
	     (EXwriteAddr == DEop2Addr)))
	begin
		fetchbuffenable = 1'b1; 	//disable (active low) 
		zerocontrol  = 1'b1; 		//disable (active low)
		pcenable  = 1'b1; 			//disable (active low)
	end
	else
	begin
		fetchbuffenable = 1'b0; 	//enable (active low) 
		zerocontrol  = 1'b0; 		//enable (active low)
		pcenable  = 1'b0; 			//enable (active low)
	end
end
	
endmodule
*/