// Top level stimulus module

`include "termprojhazdet.v"

module termprojhazdettb;

// Declare variables for stimulating input
reg [3:0] EXwriteAddr, DEop1Addr, DEop2Addr;
reg EXreadbit;
wire fetchbuffenable, zerocontrol, pcenable;

initial
        $vcdpluson;

initial
       $monitor($time, " EXreadbit = %d EXwriteAddr = %d DEop1Addr = %d DEop2Addr = %d \n\t\t\tIF_z_pc = %b",  
							EXreadbit,EXwriteAddr,DEop1Addr,DEop2Addr,{fetchbuffenable,zerocontrol,pcenable});
// Instantiate the design block ALU
hazdet c1(EXwriteAddr, DEop1Addr, DEop2Addr, EXreadbit,fetchbuffenable, zerocontrol, pcenable);

// Stimulate the Clear Signal
initial
begin
       EXreadbit = 1'd0;				//read enabled but no addr match
	   EXwriteAddr = 4'd5;
       DEop1Addr = 4'd2;
	   DEop2Addr = 4'd3;	   
	   #10
	   
       EXreadbit = 1'd0;				//read enabled and addr match
	   EXwriteAddr = 4'd5;
       DEop1Addr = 4'd2;
	   DEop2Addr = 4'd5;	   
	   #10
	   
       EXreadbit = 1'd1;				//read disabled and addr match
	   EXwriteAddr = 4'd5;
       DEop1Addr = 4'd5;
	   DEop2Addr = 4'd5;	   
	   #10
	   
       EXreadbit = 1'd1;				//read disabled and no addr match
	   EXwriteAddr = 4'd5;
       DEop1Addr = 4'd2;
	   DEop2Addr = 4'd3;	   
	   #10
	   
       EXreadbit = 1'bx;				//test
	   EXwriteAddr = 4'bx;
       DEop1Addr = 4'd5;
	   DEop2Addr = 4'd5;	

end

// Finish the simulation at time 200
initial
begin
       #60 $finish;
end

endmodule