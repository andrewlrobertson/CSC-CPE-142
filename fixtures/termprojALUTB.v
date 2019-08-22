// Top level stimulus module

`include "termprojALU.v"

module ALUTB;

// Declare variables for stimulating input
reg signed [15:0] a, b; 
reg [2:0] s; 
wire signed [15:0] yhigh, ylow; 
wire n,z;

initial
        $vcdpluson;

initial
       $monitor($time, " Input A = %d Input B = %d Output high = %d Output low = %d Neg = %d Zero = %d",  
							a, b,yhigh,ylow,n,z);
// Instantiate the design block ALU
ALU c1(a, b, s, yhigh, ylow, n, z);

// Stimulate the Clear Signal
initial
begin
       a = 15'd10;
	   b = 15'd5;
	   
	       s = 3'd0;
       #10 s = 3'd1;
       #10 s = 3'd2;
       #10 s = 3'd3;
       #10 s = 3'd4;
       #10 s = 3'd5;
       #10 s = 3'd6;
       #10 s = 3'd7;
	   
	   
	   #10
       a = 15'd1001;
	   b = 15'd1001;
	   
	       s = 3'd0;
       #10 s = 3'd1;
       #10 s = 3'd2;
       #10 s = 3'd3;
       #10 s = 3'd4;
       #10 s = 3'd5;
       #10 s = 3'd6;
       #10 s = 3'd7;
	   
	   
	   #10
       a = 15'd0;
	   b = 15'd0;
	   
	       s = 3'd0;
       #10 s = 3'd1;
       #10 s = 3'd2;
       #10 s = 3'd3;
       #10 s = 3'd4;
       #10 s = 3'd5;
       #10 s = 3'd6;
       #10 s = 3'd7;
	   
	   
	   #10
       a = 15'd0;
	   b = 15'd1001;
	   
	       s = 3'd0;
       #10 s = 3'd1;
       #10 s = 3'd2;
       #10 s = 3'd3;
       #10 s = 3'd4;
       #10 s = 3'd5;
       #10 s = 3'd6;
       #10 s = 3'd7;
	   
	   
	   #10
       a = 15'd1;
	   b = 15'd16;
	   
	       s = 3'd0;
       #10 s = 3'd1;
       #10 s = 3'd2;
       #10 s = 3'd3;
       #10 s = 3'd4;
       #10 s = 3'd5;
       #10 s = 3'd6;
       #10 s = 3'd7;
end

// Finish the simulation at time 200
initial
begin
       #400 $finish;
end

endmodule