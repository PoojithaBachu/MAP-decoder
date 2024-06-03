`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2024 15:33:05
// Design Name: 
// Module Name: top_bck
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


module top_bck(clk,rst,done_bck,a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,count_main);
input clk,rst;
output done_bck;
input signed [15:0] a0,a1,a2,a3,a4,a5,a6,a7;

wire w_r_f,w_r_b;
wire [3:0] count_bck, done_count_bck;
wire [7:0] ad_addr,bd_addr;
output signed [15:0] b0,b1,b2,b3,b4,b5,b6,b7;
input [7:0] count_main;
cont_bck cont_b1(.clk(clk),.rst(rst),.w_r_b(w_r_b),.bd_addr(bd_addr),.count_bck(count_bck),.done_count_bck(done_count_bck),.done_bck(done_bck),.count_main(count_main));
counter_bck count_b1(.clk(clk),.rst(rst),.count_bck(count_bck),.done_count_bck(done_count_bck),.done_bck(done_bck));
one_stage_bck stage_b1(.clk(clk),.rst(rst),.bd_addr(bd_addr),.b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),.w_r_b(w_r_b),
.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7));
endmodule
