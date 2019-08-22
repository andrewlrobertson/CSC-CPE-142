// Top level stimulus module

`include "termprojadder.v"

module addertb;

// Declare variables for stimulating input
reg signed [15:0] a,b; 
wire signed [15:0] y;

initial
        $vcdpluson;

initial
       $monitor($time, " Input A = %d Input B = %d Output = %d",  
							a,b,y);
// Instantiate the design block ALU
adder c1(a,b,y);

// Stimulate the Clear Signal
initial
begin
       a = 16'd50; b = 16'd150;   
	   #10 
	   a = 16'd1250; b = -16'd1300;
end

// Finish the simulation at time 200
initial
begin
       #50 $finish;
end

endmodule