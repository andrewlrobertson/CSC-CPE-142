`include "termprojbuffone.v"

module buffonetb;

reg  clk, enable, reset;
reg  [133:0] read_in;
wire [133:0] data_out;

initial
        $vcdpluson;

initial
       $monitor($time, " \nread_in = %b \ndata_out = %b", read_in, data_out);

buffone uut (clk,enable,reset, read_in, data_out);
initial  clk = 0;

always   #10 clk = ~ clk;

initial
begin
	reset = 1'b1;
	enable = 1'b0; //setting read_in 
	read_in[112:97] = 16'd1011; //example of adder input
	read_in[15:0] = 16'd0111; // example of instruction memory input
	#12;
	enable = 1'b1; //stopping read_in to retain previous values
	read_in[112:97] = 16'd0000; //example of adder input
	read_in[15:0] = 16'd0000; // example of instruction memory input
end

initial
begin
       #100 $finish;
end

endmodule
