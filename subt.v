`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2024 01:43:47
// Design Name: 
// Module Name: subt
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


module subt(inp1,inp2,outp,clk);
input signed [15:0] inp1,inp2;
input clk;
output reg signed[15:0] outp;

always @(posedge clk)
    begin
        outp = inp1 - inp2;
    end
endmodule
