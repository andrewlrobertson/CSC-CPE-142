module pc (input clk, clr, load, input [15:0] da, output reg [15:0] qa);

always@(negedge clr or  posedge clk)
begin
    if(!clr) qa <= 0;
    else if (!load)
       qa <= da;
end

endmodule



