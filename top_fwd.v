`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2024 14:25:11
// Design Name: 
// Module Name: top_fwd
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


module top_fwd(clk,rst,done_fwd,a0,a1,a2,a3,a4,a5,a6,a7,count_main);
input clk,rst;
input [7:0] count_main;
output signed [15:0] a0,a1,a2,a3,a4,a5,a6,a7;
output done_fwd;

wire w_r_fwd,done_fwd;
wire [7:0] ad_addr;
wire [3:0] count,done_count;

cont_fwd cont1(.clk(clk),.rst(rst),.w_r(w_r_fwd),.ad_addr(ad_addr),.count(count),.done_count(done_count),.done_fwd(done_fwd),.count_main(count_main));
counter count1(.clk(clk),.rst(rst),.count(count),.done_count(done_count),.done_fwd(done_fwd));
one_stage stage1(.clk(clk),.rst(rst),.ad_addr(ad_addr),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7),.w_r(w_r_fwd));

endmodule
