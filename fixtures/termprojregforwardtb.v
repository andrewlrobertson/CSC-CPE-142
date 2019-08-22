// Top level stimulus module

`include "termprojregforward.v"

module regforwardtb;

// Declare variables for stimulating input
reg [3:0] 	EXr15, EXOP1, EXOP2, memwrite1,
			wbwrite1, memwrite2, wbwrite2;
reg			memmux, wbmux;
wire [2:0]  MUXA, MUXB, MUXC;

initial
        $vcdpluson;

initial
       $monitor($time, " MUXA = %b MUXB = %b MUXC = %b",MUXA, MUXB, MUXC);
	   
// Instantiate the design block ALU
regforward c1(EXr15, EXOP1, EXOP2, memwrite1,
			wbwrite1, memwrite2, wbwrite2,
			memmux, wbmux,
			MUXA, MUXB, MUXC);

// Stimulate the Clear Signal
initial
begin
																	//NO MATCHES
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

//-----------------------------MUXA-------------------------------------

																	//memwrite1 == OP1
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b1110; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbwrite1 == OP1
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b1110; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//memOP2 == OP1
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b1110;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbOP2 == OP1
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b1110;		wbmux = 1'b0;			//WB

#10

																	//memr15 == OP1
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b1110;  	memmux = 1'b1;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbr15 == OP1
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b1110;		wbmux = 1'b1;			//WB

#10


//-----------------------------MUXB-------------------------------------
																	//memwrite1 == OP2
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b1100; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbwrite1 == OP2
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b1100; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//memOP2 == OP2
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b1100;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbOP2 == OP2
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b1100;		wbmux = 1'b0;			//WB

#10

																	//memr15 == OP2
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b1100;  	memmux = 1'b1;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbr15 == OP2
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b1100;		wbmux = 1'b1;			//WB

#10
//-----------------------------MUXC--------------------------------------
																	//memwrite1 == EXr15
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b1111; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbwrite1 == EXr15
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b1111; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//memOP2 == EXr15
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b1111;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbOP2 == EXr15
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b1111;		wbmux = 1'b0;			//WB

#10

																	//memr15 == EXr15
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b1111;  	memmux = 1'b1;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b0011;		wbmux = 1'b0;			//WB

#10

																	//wbr15 == EXr15
EXr15 = 4'b1111; EXOP1 = 4'b1110; EXOP2 = 4'b1100; 					//Decode
memwrite1 = 4'b0000; memwrite2 = 4'b0010;  	memmux = 1'b0;			//Memory
wbwrite1 = 4'b0001; wbwrite2 = 4'b1111;		wbmux = 1'b1;			//WB
end

// Finish the simulation at time 200
initial
begin
       #400 $finish;
end

endmodule