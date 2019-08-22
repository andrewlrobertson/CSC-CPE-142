// Top level stimulus module

`include "cpu.v"

module cpu_fixture;

// Declare variables for stimulating input
reg clk, reset;

initial
        $vcdpluson;

initial
//       $monitor($time, " clk = %b reset = %b", clk, reset);
	   	$monitor($time, "\n",	
//						"\npre ifid buff outputs -- IM: %b\tPC: %d\thaztopc: %b\nleftmuxsel: %b\trightmuxsel: %b\n\n", 
//						uut.imout, uut.pcout, uut.haztopc, uut.muxenresult, uut.IFjumpout,
		
						"/////////// IFID buffer output //////////\n\ninstruction: %b\tpc+2: %d\n\n", 
						uut.imset, uut.IDpc,
								
//						"pre idex buff outputs -- r15: %d\top1: %d\top2:%d\n\n", 
//						uut.reg15, uut.read1, uut.read2, 
 
						"/////////// IDEX buffer output //////////\npc: %d\tcontrol: %b\nR15: %d\tOP1: %d\tOP2: %d\nop1 address: %b\top2 address: %b\n\n", 
						uut.adda, uut.muxcontrolbuffout,uut.r15, uut.op1, uut.op2, uut.op1address, uut.op2address,
 
//						"pre exmem buff outputs -- adder: %d\n\n", 
//						uut.exaddout,  
 
						"/////////// EXMEM buffer output /////////\ncontrol: %b\tpc: %d\nALU output: %b\nALU dec high: %d\nALU dec low: %d\nnflag: %b\tzflag: %b\nmemory write 16: %d\tmemory write 8: %d\nwrite 1 address: %b\twrite 2 address: %b\n\n",
						{uut.writethrough, uut.memenable, uut.memR_WR, uut.eightbit, uut.branchenable},
						uut.Mempc, uut.ALUout, uut.ALUout[31:16], uut.ALUout[15:0],uut.nflag, uut.zflag, uut.write16, uut.write16[7:0],
						uut.memwriteadd1, uut.memwriteadd2,
 
						"/////////// MEMWB buffer output /////////\ncontrol: %b\nALU output: %b\nmemory read 16: %d\nwrite 1 address: %b\twrite 2 address: %b\n\n", 
						{uut.wbenable1, uut.wbenable2, uut.memalu}, uut.aludata, uut.memdata,
						uut.writeadd1, uut.writeadd2);
 
// Instantiate the design block ALU
cpu uut(clk, reset);

// Stimulate the Clock Signal
always
#5 clk = ~clk;

initial
begin
clk = 1'b0 ; reset = 1'b0;
#7 reset = 1'b1;
end

// Finish the simulation at time 200
initial
begin
  #300 $finish;
end

endmodule
