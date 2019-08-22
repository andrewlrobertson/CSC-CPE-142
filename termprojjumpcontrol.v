module jumpcontrol(input [3:0] opcode,
			  output reg jump);
				  
always @*
begin
	if (opcode == 4'b1100) jump=1'b1;
	else jump=1'b0;
end
endmodule