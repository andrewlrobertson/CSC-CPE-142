module regblock(input [3:0] readaddress1, readaddress2,
							writeaddress1, writeaddress2,
				input [15:0]writedata1, writedata2,
				input		clk, enable1, enable2, reset,
				output reg [15:0] reg15, read1, read2, 
				output reg [3:0]  reg15address);

//data block

reg [15:0] registers [15:0];


//write rising edge

always @(posedge clk)
begin
	if (!enable1) registers[writeaddress1] <= writedata1;
	if (!enable2) registers[writeaddress2] <= writedata2;
end

//read falling edge

always @*
begin
	reg15 <= registers[15];
	read1 <= registers[readaddress1];
	read2 <= registers[readaddress2];
	reg15address <= 4'b1111;
end

always @*
begin
	if (!reset) 
		

		registers[(0)] <= 16'd0;
		registers[(1)] <= 16'h0F00;
		registers[(2)] <= 16'h0050;
		registers[(3)] <= 16'hFF0F;
		registers[(4)] <= 16'hF0FF;
		registers[(5)] <= 16'h0040;
		registers[(6)] <= 16'h6666;
		registers[(7)] <= 16'h00FF;
		registers[(8)] <= 16'hFF77;
		registers[(9)] <= 16'h0000;
		registers[(10)] <=16'h0000;
		registers[(11)] <=16'h0000;
		registers[(12)] <= 16'hCC89;
		registers[(13)] <= 16'h0002;
		registers[(14)] <= 16'h0000;
		registers[(15)] <= 16'h0000;
end

endmodule