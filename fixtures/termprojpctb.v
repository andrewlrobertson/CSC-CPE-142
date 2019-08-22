`include "termprojpc.v"

module pctb;

reg       	clk, clr, load;
reg [15:0] 	da;
wire [15:0] qa;

initial
        $vcdpluson;

initial
       $monitor($time, " da = %d qa = %d active low load = %b",  
							da,qa, load);

pc uut (clk,clr,load,da,qa);

initial  clk = 0;

always   #10 clk = ~ clk;

initial
begin
    clr = 0; load = 1;
    da  = 16'd1011;
   
    #24  clr = 1; load = 0;
	#20  da  = 16'd0101;
end

initial
begin
       #100 $finish;
end

endmodule