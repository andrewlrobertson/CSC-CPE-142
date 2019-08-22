// Top level stimulus module

`include "termproj41mux.v"

module fouronemuxtb;

// Declare variables for stimulating input
reg [15:0] a,b,c,d; 
reg [1:0] sel; 
wire [15:0] y;

initial
        $vcdpluson;

initial
       $monitor($time, " Input A = %d Input B = %d Input C = %d Input D = %d SEL = %d Output = %d",  
							a,b,c,d,sel,y);
// Instantiate the design block ALU
fouronemux c1(a,b,c,d,sel,y);

// Stimulate the Clear Signal
initial
begin
       a = 16'd50;
	   b = 16'd100;
       c = 16'd5000;
	   d = 16'd10000;	   
	   
	       sel = 2'd0;
       #10 sel = 2'd1;
       #10 sel = 2'd2;
       #10 sel = 2'd3;


end

// Finish the simulation at time 200
initial
begin
       #50 $finish;
end

endmodule