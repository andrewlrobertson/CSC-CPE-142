// Top level stimulus module

`include "termprojpathcontrol.v"

module pathcontroltb;

// Declare variables for stimulating input
reg [3:0] opcode, functcode;
wire [13:0] control;

initial
        $vcdpluson;

initial
       $monitor($time, " Opcode = %d functcode = %d control = %b",
							opcode, functcode, control);
// Instantiate the design block ALU
pathcontrol c1(opcode, functcode, control);

// Stimulate the Clear Signal
initial
begin
    
    opcode = 4'b1111; functcode = 4'b1010; #10    //halt
    opcode = 4'b1100; functcode = 4'b1010; #10    //jump
    opcode = 4'b0110; functcode = 4'b1010; #10    //beq
    opcode = 4'b0101; functcode = 4'b1010; #10    //bgt
    opcode = 4'b0100; functcode = 4'b1010; #10    //blt
    opcode = 4'b1011; functcode = 4'b1010; #10    //sw
    opcode = 4'b1010; functcode = 4'b1010; #10    //lw
    opcode = 4'b1001; functcode = 4'b1010; #10    //sb
    opcode = 4'b1000; functcode = 4'b0100; #10    //lbu
    opcode = 4'b0010; functcode = 4'b1000; #10    //ori
    opcode = 4'b0001; functcode = 4'b1110; #10    //andi
    opcode = 4'b0000; functcode = 4'b1111; #10    //swp
    opcode = 4'b0000; functcode = 4'b1110; #10    //mv
    opcode = 4'b0000; functcode = 4'b1000; #10    //div
    opcode = 4'b0000; functcode = 4'b0100; #10    //mul
    opcode = 4'b0000; functcode = 4'b0001; #10    //sub
    opcode = 4'b0000; functcode = 4'b0000; #10    //add
    opcode = 4'b0000; functcode = 4'b0111; #10    //invalid
    opcode = 4'b0111; functcode = 4'b1010;        //invalid
	   
end

// Finish the simulation at time 200
initial
begin
       #220 $finish;
end

endmodule