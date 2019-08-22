// Top level stimulus module

`include "termprojjumpcontrol.v"

module jumpcontroltb;

// Declare variables for stimulating input
reg [3:0] opcode;
wire jump;

initial
        $vcdpluson;

initial
       $monitor($time, " Opcode = %d Jump = %d",
							opcode, jump);
// Instantiate the design block ALU
jumpcontrol(opcode,jump);

// Stimulate the Clear Signal
initial
begin
      opcode = 4'd0; #10				//read enabled but no addr match
	    opcode = 4'd12;
end

// Finish the simulation at time 200
initial
begin
       #30 $finish;
end

endmodule