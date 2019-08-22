// Top level stimulus module

`include "termprojeightonemux.v"

module eightonemuxtb;

// Declare variables for stimulating input
reg [15:0] a,b,c,d, e, f, g, h; 
reg [2:0] sel; 
wire [15:0] y;

initial
        $vcdpluson;

initial
       $monitor($time, " Input A = %d Input B = %d Input C = %d Input D = %d Input E = %d Input F = %d Input G = %d Input H = %d SEL = %d Output = %d",  
							a,b,c,d,e, f, g, h, sel,y);
// Instantiate the design block ALU
eightonemux c1(a,b,c,d,e,f,g,h,sel,y);

// Stimulate the Clear Signal
initial
begin
       a = 16'd50;
	   b = 16'd100;
       c = 16'd5000;
	   d = 16'd10000;
	   e = 16'd12;
	   f = 16'd2;
	   g = 16'd9000;
	   h = 16'd1234;
	   
	       sel = 3'd0;
       #10 sel = 3'd1;
       #10 sel = 3'd2;
       #10 sel = 3'd3;
	   #10 sel = 3'd4;
       #10 sel = 3'd5;
       #10 sel = 3'd6;
       #10 sel = 3'd7;


end

// Finish the simulation at time 200
initial
begin
       #90 $finish;
end

endmodule