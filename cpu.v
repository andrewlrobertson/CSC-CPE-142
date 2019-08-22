`include "termproj41mux.v"
`include "termprojadder.v"
`include "termprojALU.v"
`include "termprojbuffone.v"
`include "termprojdatamem.v"
`include "termprojhazdet.v"
`include "termprojinstrmem.v"
`include "termprojjumpcontrol.v"
`include "termprojleftshift.v"
`include "termprojpathcontrol.v"
`include "termprojpc.v"
`include "termprojregblock.v"
`include "termprojregforward.v"
`include "termprojeightonemux.v"
`include "termprojzeroext.v"
`include "termprojtwoonemux.v"
`include "termprojsignext.v"

module cpu(input clk, reset);

//wires
wire 		haztopc, haztobuff, wbenable1, wbenable2; 
reg 		muxenresult;
wire [15:0] Mempc;
wire [15:0] memdata, writedata1;
wire [31:0] aludata;
wire 		memalu;
wire [15:0] muxtopcmux, muxtopc, pcout, imout, IFextout, IFaddtopout, IFaddbotout;
wire 		IFjumpout;
wire 		memR_WR, memenable, eightbit, branchenable, zflag, nflag;
wire [15:0] IDpc, imset;
wire [3:0] 	writeadd1, writeadd2, reg15address;
wire [15:0] reg15, read1, read2, typebextout, zeroregout;
wire 		zerocontrol;
wire [13:0] muxcontrolout;
wire [13:0] muxcontrolbuffout;
wire [3:0] 	r15address, op2address, op1address;
wire [15:0] input1, input2, yhigh, ylow, alusignext, signextalu, op1regforward, exsignout,
			r15regforward, op2regforward, exzeroext, adda, addb, exaddout,op1, op2, r15;
wire 		neg, zero,input1sel, input2sel, wbsel, wbsel2, wbsel3;
wire [2:0] 	alusel, op1sel, op2sel, r15sel;
wire [7:0] 	exsignin;
wire [31:0] ALUout;
wire [3:0] 	memwriteadd1, memwriteadd2;
wire [15:0] write16, read16, read8ext, memmuxout, branchtarget;
wire [2:0] 	writethrough;
wire [7:0] 	read8;
wire [3:0] 	memwrite1, wbwrite1, memwrite2, wbwrite2, muxaddout;
wire [13:0] control;



//IF////////////////////////////////////////////////////////////////////////////////////////////////////
			
adder IFaddtop(16'd2, pcout, IFaddtopout);

always@*
muxenresult = 1'b0 ;//branch not doing well((!zflag&!branchenable)|(!nflag&!branchenable));

twoonemux #(16) IFleft(IFaddtopout, Mempc, muxenresult, muxtopcmux);

twoonemux #(16) IFright(muxtopcmux, IFaddbotout, IFjumpout, muxtopc);

adder IFaddbot(IFextout,pcout,IFaddbotout);

signext #(12) IFsigned(imout[11:0],IFextout);

jumpcontrol j1(imout[15:12],IFjumpout);

instrmem i1(pcout, 16'd0, clk, 1'b1, 1'b0, reset, imout);
 
pc p1(clk, reset, 1'b0,muxtopc, pcout); //haztopc temp removed, forcing enable

buffone #(32) IFID (clk, 1'b0, 1'b1, {IFaddtopout , imout}, {IDpc, imset}); //haztobuff temp removed, forcing enable



//ID////////////////////////////////////////////////////////////////////////////////////////////////////

regblock r1(imset[11:8], imset[7:4], writeadd1, writeadd2,writedata1, aludata[31:16],
		clk, wbenable1, wbenable2, reset, reg15, read1, read2, reg15address);
		
zeroext #(8) z1(imset[7:0], zeroregout);

signext #(4) s1(imset[3:0], typebextout);

twoonemux #(14) t1(control ,14'd0 ,zerocontrol , muxcontrolout);

buffone #(130) IDEX (clk, 1'b0, 1'b1, {imset[7:0],typebextout, zeroregout, imset[7:4], imset[11:8], muxcontrolout, IDpc, reg15, read1, read2, reg15address}, {exsignin,signextalu, exzeroext,op2address, op1address, muxcontrolbuffout, adda, r15, op1, op2, r15address});



//EX////////////////////////////////////////////////////////////////////////////////////////////////////

ALU a1(input1, input2, muxcontrolbuffout[5:3], yhigh, ylow, neg, zero);

twoonemux #(16) t2(signextalu, op1regforward, muxcontrolbuffout[6],input1);

fouronemux f1(r15regforward,op2regforward, exzeroext,16'b0,muxcontrolbuffout[2:1],input2);

twoonemux #(4) t3(op2address, r15address, muxcontrolbuffout[0], muxaddout);

adder a2(adda, addb, exaddout);

leftshift l1(exsignout,addb);

signext #(8) s2(exsignin,exsignout);

eightonemux e1(op1, ALUout[15:0],writedata1,ALUout[31:16],aludata[15:0],ALUout[31:16],aludata[15:0],op1,op1sel,op1regforward);

eightonemux e2(r15, ALUout[15:0],writedata1,ALUout[31:16],aludata[15:0],ALUout[31:16],aludata[15:0],r15,r15sel,r15regforward);

eightonemux e3(op2, ALUout[15:0],writedata1,ALUout[31:16],aludata[15:0],ALUout[31:16],aludata[15:0],op2,op2sel,op2regforward);

buffone #(82) EXM (clk, 1'b0, 1'b1, {wbsel,muxcontrolbuffout[13:7], exaddout, op1, neg, zero, yhigh, ylow, muxaddout, op1address}, {wbsel2,writethrough, memenable,
				   memR_WR, eightbit, branchenable, Mempc, write16, zflag, nflag, ALUout, memwriteadd2, memwriteadd1});

				   
				   
//MEM///////////////////////////////////////////////////////////////////////////////////////////////////

datamem d3(ALUout[15:0], write16, write16[7:0], clk, memR_WR, memenable, eightbit, reset, read16, read8);

twoonemux #(16) memmux(read16, read8ext,!eightbit, memmuxout);

zeroext #(8) z2(read8, read8ext);

buffone #(60) MW (clk, 1'b0, 1'b1, {wbsel2, writethrough, memmuxout, ALUout, memwriteadd2, memwriteadd1}, {wbsel3, wbenable1, wbenable2, memalu, memdata, aludata, writeadd2, writeadd1});



//WB////////////////////////////////////////////////////////////////////////////////////////////////////

twoonemux #(16) wb(memdata, aludata[15:0], memalu, writedata1);



//Hazard///////////////////////////////////////////////////////////////////////////////////////////////

pathcontrol p2(imset[15:12], imset[3:0], control);

regforward r2(r15address, op1address, op2address, memwriteadd1,
			      writeadd1, memwriteadd2, writeadd2,wbsel2, wbsel3, op1sel, op2sel, r15sel);

hazdet h1(op1address, imset[11:8], imset[7:4], muxcontrolbuffout[1], haztobuff, zerocontrol, haztopc);


endmodule
