// Top level stimulus module

`include "termprojinstrmem.v"

module instrmemtb;

// Declare variables for stimulating input
reg [15:0]address, setup;
reg		clk, R_WR, enable, reset;
wire [15:0] instruction; 

initial
        $vcdpluson;

initial
       $monitor($time, " address = %d setup = %d instruction = %d",  
							address, setup, instruction);
// Instantiate the design block ALU
instrmem m1 (address, setup,clk, R_WR, enable, reset, instruction); 

// Provide clock
always
begin
#5 clk = ~clk;
end

// Stimulate the Clear Signal
initial
begin
	clk = 1'b0;		R_WR = 1'b0;	enable = 1'b0;			//write mode and enabled
	reset = 1;
	#7 	address = 16'd0;			setup = 16'd12;
	#10 address = 16'd10;			setup = 16'd34;	
	#10 address = 16'd20;			setup = 16'd56;	
	#10 address = 16'd30;			setup = 16'd78;	
	#10 address = 16'd40;			setup = 16'd90;	
	#10 address = 16'd50;			setup = 16'd1234;	
	#10 address = 16'd60;			setup = 16'd5678;	
	#10 address = 16'd70;			setup = 16'd1234;	
	#10 address = 16'd80;			setup = 16'd5678;	
	#10 address = 16'd90;			setup = 16'd12345;	
	#10 address = 16'd100;			setup = 16'd50123;	
	#10 address = 16'd200;			setup = 16'd9012;		
	
	#10 R_WR = 1'b1;										//read mode
	
	#10 address = 16'd0;		
	#10 address = 16'd10;		
	#10 address = 16'd20;		
	#10 address = 16'd30;		
	#10 address = 16'd40;		
	#10 address = 16'd50;		
	#10 address = 16'd60;			
	#10 address = 16'd70;			
	#10 address = 16'd80;		
	#10 address = 16'd90;		
	#10 address = 16'd100;		
	#10 address = 16'd200;		
	#10
	reset = 0;
	#10 address = 16'h0000;

end

// Finish the simulation at time 300
initial
begin
       #300 $finish;
end

endmodule
