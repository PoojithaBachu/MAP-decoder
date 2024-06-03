`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2024 01:11:10
// Design Name: 
// Module Name: comp8
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


module comp8(in0,in1,in2,in3,in4,in5,in6,in7,out,clk);
input signed [15:0] in0,in1,in2,in3,in4,in5,in6,in7;
output reg signed [15:0] out;
input clk;

reg [15:0] g00,g11,g22,g33,g01,g23,g;

always @(posedge clk)
    begin
                g00 = (in0>in1) ? in0:in1;
                g11 = (in2>in3) ? in2:in3;
                g22 = (in4>in5) ? in4:in5;
                g33 = (in6>in7) ? in6:in7;
                g01 = (g00>g11) ? g00:g11;
                g23 = (g22>g33) ? g22:g33;
                out   = (g01>g23) ? g01:g23;
            
    end
endmodule
