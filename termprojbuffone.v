module buffone #(parameter SIZE = 134) (input clk, enable, reset, input [SIZE-1:0] read_in, 
				 output reg [SIZE-1:0] data_out);
		
reg [SIZE-1:0] data_in;		
		
	always @(posedge clk)
	begin
		if (!enable) data_in <= read_in;
	end
	
	always @(*)
	begin
		
			if (!reset) data_in <= {SIZE{1'b0}};
		
		data_out <= data_in;
	end
	
endmodule
