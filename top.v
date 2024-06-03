`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2024 15:52:15
// Design Name: 
// Module Name: top
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


module top(clk,rst,done_fwd,done_bck,done_gama,gout);
input clk,rst;
output done_fwd,done_bck,done_gama,gout;
wire signed [15:0] a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7;
wire [7:0] count_main;
wire signed  [15:0] e00,e10,e20,e30,e40,e50,e60,e70,e01,e11,e21,e31,e41,e51,e61,e71;
wire signed [15:0] lam0,lam1,gamma,gd;
wire [7:0] gn_addr;

counter_main count_m(.clk(clk),.rst(rst),.count_main(count_main),.done_gama(done_gama));
top_fwd fwd1(.clk(clk),.rst(rst),.done_fwd(done_fwd),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7),.count_main(count_main));
top_bck bck1(.clk(clk),.rst(done_fwd),.done_bck(done_bck),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7),.b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),.count_main(count_main));
fwd_eta eta1(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7),.b0(b0),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),.b6(b6),.b7(b7),.clk(clk),.rst(done_bck),.e00(e00),.e10(e10),.e20(e20),.e30(e30),.e40(e40),.e50(e50),.e60(e60),.e70(e70),.e01(e01),.e11(e11),.e21(e21),.e31(e31),.e41(e41),.e51(e51),.e61(e61),.e71(e71));
comp8 comp_eta0(.in0(e00),.in1(e10),.in2(e20),.in3(e30),.in4(e40),.in5(e50),.in6(e60),.in7(e70),.out(lam0),.clk(clk));
comp8 comp_eta1(.in0(e01),.in1(e11),.in2(e21),.in3(e31),.in4(e41),.in5(e51),.in6(e61),.in7(e71),.out(lam1),.clk(clk));
subt sub1(.inp1(lam0),.inp2(lam1),.outp(gamma),.clk(clk));
g_cont gama_cont(.w_r_gn(w_r_gn),.gn_addr(gn_addr),.clk(clk),.rst(rst),.count_main(count_main),.done_gama(done_gama));
gama_SRAM g_SRAM(.g(gamma),.gd(gd),.rst(rst),.w_r(w_r_gn),.clk(clk),.gama_addr(gn_addr));
gama_red g_red(.gama(gd),.gr(gout),.clk(clk));

ila_0 ila_map(clk,rst,done_fwd,done_bck,done_gama,gout,gd);
endmodule
