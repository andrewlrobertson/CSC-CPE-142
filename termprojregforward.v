module regforward (input [3:0] 		EXr15, EXOP1, EXOP2, memwrite1,
									wbwrite1, memwrite2, wbwrite2,
					input			memmux, wbmux,
                   output reg [2:0] MUXA, MUXB, MUXC);
                   
always @ *
begin



//MUXA
if (EXOP1 == memwrite1) MUXA = 3'b001;
else if (EXOP1 == wbwrite1) MUXA = 3'b010;
else if (EXOP1 == memwrite2)
	begin
	  if(memmux) MUXA = 3'b101;
	  else MUXA = 3'b011;
	end
else if (EXOP1 == wbwrite2)
	begin
	  if(wbmux) MUXA = 3'b110;
	  else MUXA = 3'b100;
	end
else MUXA = 0;



//MUXB
if (EXOP2 == memwrite1) MUXB = 3'b001;
else if (EXOP2 == wbwrite1) MUXB = 3'b010;
else if (EXOP2 == memwrite2)
	begin
	  if(memmux) MUXB = 3'b101;
	  else MUXB = 3'b011;
	end
else if (EXOP2 == wbwrite2)
	begin
	  if(wbmux) MUXB = 3'b110;
	  else MUXB = 3'b100;
	end
else MUXB = 0;



//MUXC
if (EXr15 == memwrite1) MUXC = 3'b001;
else if (EXr15 == wbwrite1) MUXC = 3'b010;
else if (EXr15 == memwrite2)
	begin
	  if(memmux) MUXC = 3'b101;
	  else MUXC = 3'b011;
	end
else if (EXr15 == wbwrite2)
	begin
	  if(wbmux) MUXC = 3'b110;
	  else MUXC = 3'b100;
	end
else MUXC = 0;



end
endmodule