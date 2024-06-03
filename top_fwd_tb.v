`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 14:45:05
// Design Name: 
// Module Name: top_fwd_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_fwd_tb();
reg clk,rst;

wire done_fwd,done_bck,done_gama,gout;

top uut(.clk(clk),.rst(rst),.done_fwd(done_fwd),.done_bck(done_bck),.done_gama(done_gama),.gout(gout));

initial begin
    clk =0;
end

always #10 clk = ~clk;

initial begin
    rst =1;
    #30;
    rst =0;
end
endmodule
