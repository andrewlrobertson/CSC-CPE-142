// Top level stimulus module

`include "termprojleftshift.v"

module leftshifttb;

// Declare variables for stimulating input
reg [15:0] a; 
wire [15:0] y;

initial
        $vcdpluson;

initial
       $monitor($time, " Input A = %b Output = %b",  
							a,y);
// Instantiate the design block ALU
leftshift c1(a,y);

// Stimulate the Clear Signal
initial
begin
       a = 16'd50;   
	   #10 
	   a = 16'd1250;
end

// Finish the simulation at time 200
initial
begin
       #50 $finish;
end

endmodule