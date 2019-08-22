// Top level stimulus module

`include "termprojregblock.v"

module regblocktb;

// Declare variables for stimulating input
reg [3:0] readaddress1, readaddress2,
			writeaddress1, writeaddress2;
reg [15:0]	writedata1, writedata2;
reg			clk, enable1, enable2, reset;
wire [15:0] reg15, read1, read2; 
wire [3:0]  reg15address;

initial
        $vcdpluson;

initial
       $monitor($time, " read1 = %d read2 = %d reg15 = %d reg15address = %b \n\t\t\treadaddress1 = %b readaddress2 = %b ",  
							read1,read2, reg15, reg15address, readaddress1, readaddress2);
// Instantiate the design block register
regblock r1		(readaddress1, readaddress2,
				writeaddress1, writeaddress2,
				writedata1, writedata2,
				clk, enable1, enable2, reset,
				reg15, read1, read2, 
				reg15address);

// Provide clock
always
begin
#5 clk = ~clk;
end

// Stimulate the Clear Signal
initial
begin
	clk = 1'b0;
	reset = 1;
	#2 	enable1 = 1'b0; 			enable2 = 1'b0; 
		writeaddress1 = 4'b0000; 	writeaddress2 = 4'b0001; 	//write 
		writedata1 = 16'd1000; 		writedata2 = 16'd2000;		//to R0 and R1
	#5 	readaddress1 = 4'b0000; 	readaddress2 = 4'b0001;		//check R0 and R1
	
	#5 	enable1 = 1'b0; 			enable2 = 1'b0; 
		writeaddress1 = 4'b0001; 	writeaddress2 = 4'b1111; 	//write 
		writedata1 = 16'd3000; 		writedata2 = 16'd4000;		//to R1 and R15
	#5 	readaddress1 = 4'b0001; 	readaddress2 = 4'b1111;		//check R1 and R15
	
	#5 	enable1 = 1'b1; 			enable2 = 1'b0; 
		writeaddress1 = 4'b0001; 	writeaddress2 = 4'b1111; 	//write 
		writedata1 = 16'd5000; 		writedata2 = 16'd6000;		//to R15
	#5 	readaddress1 = 4'b0001; 	readaddress2 = 4'b1111;		//check R1 and R15
	#10  //	enable1 = 1'b0;
	reset = 0;
end

// Finish the simulation at time 50
initial
begin
       #50 $finish;
end

endmodule
