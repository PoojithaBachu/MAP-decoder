`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2024 20:58:10
// Design Name: 
// Module Name: gama_red
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


module gama_red(gama,gr,clk);
input signed [15:0] gama;
input clk;
output reg gr;
always @(posedge clk)
    begin
        gr = ^gama;
    end
endmodule
