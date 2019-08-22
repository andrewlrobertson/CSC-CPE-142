// Top level stimulus module

`include "termprojtwoonemux.v"

module twoonemuxtb;

// Declare variables for stimulating input
reg [3:0] a,b; 
reg sel; 
wire [3:0] y;

initial
        $vcdpluson;

initial
       $monitor($time, " Input A = %d Input B = %d SEL = %b Output = %d",  
							a,b, sel,y);
// Instantiate the design block ALU
twoonemux #(4)c1(a,b,sel,y);

// Stimulate the Clear Signal
initial
begin
       a = 4'd15;
	   b = 4'd8;	   
	   
	       sel = 1'd0;
       #10 sel = 1'd1;
	   #10 sel = 1'bx;
end

// Finish the simulation at time 200
initial
begin
       #50 $finish;
end

endmodule