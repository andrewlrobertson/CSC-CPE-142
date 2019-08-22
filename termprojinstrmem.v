module instrmem(input [15:0]address, setup,
				input		clk, R_WR, enable, reset,
				output reg [15:0] instruction); 

//data block

reg [7:0] data [511:0];

//write rising edge

always @(posedge clk)
begin
	if (!enable & !R_WR)
		{data[(address%128)] , data[(address%128 + 1)]} <= setup;
end

//read falling edge

always @(*)
begin
	if (!enable & R_WR)
	begin
		instruction <= {data[(address%128)] , data[(address%128 + 1)]};
	end
end

always @(negedge reset)
begin
	if (!reset) 
		

		data[(16'h0000)] <= 8'h01;
		data[(16'h0001)] <= 8'h20;
		data[(16'h0002)] <= 8'h01;
		data[(16'h0003)] <= 8'h21;
		data[(16'h0004)] <= 8'h23;
		data[(16'h0005)] <= 8'hFF;
		data[(16'h0006)] <= 8'h13;
		data[(16'h0007)] <= 8'h4C;
		data[(16'h0008)] <= 8'h05;
		data[(16'h0009)] <= 8'h64;
		data[(16'h000A)] <= 8'h01;
		data[(16'h000B)] <= 8'h58;
		data[(16'h000C)] <= 8'h0F;
		data[(16'h000D)] <= 8'hF1;
		data[(16'h000E)] <= 8'h04;
		data[(16'h000F)] <= 8'h8E;
		data[(16'h0010)] <= 8'h04;
		data[(16'h0011)] <= 8'h6F;
		data[(16'h0012)] <= 8'h24;
		data[(16'h0013)] <= 8'h02;
		data[(16'h0014)] <= 8'h86;
		data[(16'h0015)] <= 8'h94;
		data[(16'h0016)] <= 8'h96;
		data[(16'h0017)] <= 8'h96;
		data[(16'h0018)] <= 8'hA6;
		data[(16'h0019)] <= 8'h96;
		data[(16'h001A)] <= 8'h67;
		data[(16'h001B)] <= 8'h04;
		data[(16'h001C)] <= 8'h0B;
		data[(16'h001D)] <= 8'h10;
		data[(16'h001E)] <= 8'h47;
		data[(16'h001F)] <= 8'h02;
		data[(16'h0020)] <= 8'h0B;
		data[(16'h0021)] <= 8'h20;
		data[(16'h0022)] <= 8'h57;
		data[(16'h0023)] <= 8'h02;
		data[(16'h0024)] <= 8'h01;
		data[(16'h0025)] <= 8'h10;
		data[(16'h0026)] <= 8'h01;
		data[(16'h0027)] <= 8'h10;
		data[(16'h0028)] <= 8'hA8;
		data[(16'h0029)] <= 8'h90;
		data[(16'h002A)] <= 8'h08;
		data[(16'h002B)] <= 8'h80;
		data[(16'h002C)] <= 8'hB8;
		data[(16'h002D)] <= 8'h92;
		data[(16'h002E)] <= 8'hAA;
		data[(16'h002F)] <= 8'h92;
		data[(16'h0030)] <= 8'h0B;
		data[(16'h0031)] <= 8'hB0;
		data[(16'h0032)] <= 8'h0D;
		data[(16'h0033)] <= 8'hD1;
		data[(16'h0034)] <= 8'h0B;
		data[(16'h0035)] <= 8'hC0;
		data[(16'h0036)] <= 8'hF0;
		data[(16'h0037)] <= 8'h00;
end

endmodule