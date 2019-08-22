// Top level stimulus module

`include "termprojdatamem.v"

module datamemtb;

// Declare variables for stimulating input
reg [15:0]	address, write16;
reg [7:0] 	write8;
reg			clk, R_WR, enable, eightbit, reset;
wire [15:0] read16;
wire [7:0]  read8;

initial
        $vcdpluson;

initial
       $monitor($time, " read16 = %b read8 = %b",  
							read16,read8);
// Instantiate the design block ALU
datamem(address, write16,
		write8,
		clk, R_WR, enable, eightbit, reset,
		read16, 
		read8);

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
	
	#2 	enable = 1'b0; 		eightbit = 1'b0;		R_WR = 1'b0;		address = 16'd167;	//enabled, 8 bit mode, write
		write8 = 8'd27;		write16 = 16'd20000;											//only write8 will apply
	#5	R_WR = 1'b1; 																		//read
	
	#5 	enable = 1'b0; 		eightbit = 1'b1;		R_WR = 1'b0;		address = 16'd167;	//enabled, 16 bit mode, write
		write8 = 8'd27;		write16 = 16'd20000;											//only write16 will apply
	#5	R_WR = 1'b1; 																		//read
	
	#5 	enable = 1'b1; 		eightbit = 1'b1;		R_WR = 1'b0;		address = 16'd167;	//disabled
		write8 = 8'd27;		write16 = 16'd20000;											//
	#5	R_WR = 1'b1; 																		//read
	
	#5 	enable = 1'b0; 		eightbit = 1'b0;		R_WR = 1'b0;		address = 16'd125;	//enabled, 8 bit mode, write
		write8 = 8'd128;	write16 = 16'd12000;											//only write8 will apply
	#5	R_WR = 1'b1; 																		//read
	
	#5 	enable = 1'b0; 		eightbit = 1'b0;		R_WR = 1'b1;		address = 16'd167;	//enabled, 8 bit mode, read
	#10
	reset = 0;
	//address = 16'd125;	
end

// Finish the simulation at time 200
initial
begin
       #100 $finish;
end

endmodule
