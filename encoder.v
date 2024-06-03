`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 12:25:06
// Design Name: 
// Module Name: encoder
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


module encoder(in_encoder,out_encoder,clk,rst,out);
input in_encoder,clk,rst;
output out_encoder;
output [2:0] out;

wire w1,w2,w3,w4,w5,w6;
d_ff f1(.in(w1),.out(w2),.clk(clk),.rst(rst));
d_ff f2(.in(w2),.out(w3),.clk(clk),.rst(rst));
d_ff f3(.in(w3),.out(w4),.clk(clk),.rst(rst));


assign w6 = w3^w4;
assign w1 = in_encoder^w6;
assign out_encoder = w1^w2^w4;
assign out = {w2,w3,w4};

endmodule

