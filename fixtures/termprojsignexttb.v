// Top level stimulus module

`include "termprojsignext.v"

module signexttb;

// Declare variables for stimulating input
reg [6:0] a; 
wire [15:0] y;

initial
        $vcdpluson;

initial
       $monitor($time, " Input A = %b Output = %b",  
							a,y);
// Instantiate the design block ALU
signext #(7)c1(a,y);

// Stimulate the Clear Signal
initial
begin
       a = 7'd50;   
	   #10 
	   a = 7'd250;
end

// Finish the simulation at time 200
initial
begin
       #50 $finish;
end

endmodule