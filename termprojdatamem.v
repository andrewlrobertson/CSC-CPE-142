module datamem(input [15:0]address, write16,
				input [7:0] write8,
				input		clk, R_WR, enable, eightbit, reset,
				output reg [15:0] read16, 
				output reg [7:0]  read8);

//data block

reg [7:0] data [511:0];
integer mufasa;
//write rising edge

always @(posedge clk)
begin
	if (!enable & !R_WR)
	begin
		if(!eightbit) data[(address%128)] <= write8;
		else {data[(address%128)] , data[(address%128 + 1)]} <= write16;
	end
end

//read falling edge

always @*
begin
	if (!enable & R_WR)
	begin
		read16 <= {data[(address%128)] , data[(address%128 + 1)]};
		read8 <= data[(address%128)];
	end
end

always @*
begin
	if (!reset) 
		for(mufasa = 0; mufasa<128; mufasa = mufasa +1) 
		begin
			data[mufasa] <= 0;
		end

		data[(16'h0000)] <= 8'h3A;
		data[(16'h0001)] <= 8'hDC;
		data[(16'h0002)] <= 8'h00;
		data[(16'h0003)] <= 8'h00;
		data[(16'h0004)] <= 8'h13;
		data[(16'h0005)] <= 8'h42;
		data[(16'h0006)] <= 8'hAD;
		data[(16'h0007)] <= 8'hDE;
		data[(16'h0008)] <= 8'hEF;
		data[(16'h0009)] <= 8'hBE;
		data[(16'h000A)] <= 8'hFF;
		data[(16'h000B)] <= 8'hFF;
		data[(16'h000E)] <= 8'hAA;
		data[(16'h000F)] <= 8'hAA;
end

endmodule
