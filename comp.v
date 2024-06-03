`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 15:04:46
// Design Name: 
// Module Name: comp
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


module comp(in1,in2,out,clk);
input clk;
input signed[15:0] in1,in2;
output reg signed[15:0] out;
reg signed [15:0]sub;

always @(posedge clk)
    begin
        sub =  in1 - in2;
        if(sub[15] ==1)
            out = in2;
        else
            out = in1;
    end
endmodule
