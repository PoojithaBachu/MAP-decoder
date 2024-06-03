`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 16:32:07
// Design Name: 
// Module Name: one_stage
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


module one_stage(clk,rst,ad_addr,a0,a1,a2,a3,a4,a5,a6,a7,w_r);
output signed [15:0] a0,a1,a2,a3,a4,a5,a6,a7;
input clk,rst,w_r;
input [7:0] ad_addr;


wire signed [15:0] ad_0,ad_1,ad_2,ad_3,ad_4,ad_5,ad_6,ad_7;
wire signed [15:0]g00,g01,g10,g11,g20,g21,g30,g31,g40,g41,g50,g51,g60,g61,g70,g71;
wire signed [15:0] s00,s01,s10,s11,s20,s21,s30,s31,s40,s41,s50,s51,s60,s61,s70,s71;
gama_ROM gama(.clk(clk),.g00(g00),.g10(g10),.g20(g20),.g30(g30),.g40(g40),.g50(g50),.g60(g60),.g70(g70),.g01(g01),.g11(g11),.g21(g21),.g31(g31),.g41(g41),.g51(g51),.g61(g61),.g71(g71));
alpha_SRAM alpha_mem(.clk(clk),.rst(rst),.write_read(w_r),.addr(ad_addr),.in_data0(ad_0),.in_data1(ad_1),.in_data2(ad_2),.in_data3(ad_3),.in_data4(ad_4),.in_data5(ad_5),.in_data6(ad_6),.in_data7(ad_7),.out_data0(a0),.out_data1(a1),.out_data2(a2),.out_data3(a3),.out_data4(a4),.out_data5(a5),.out_data6(a6),.out_data7(a7));

//S0 
adder ad00(.a(a0),.b(g00),.s(s00),.clk(clk));
adder ad01(.a(a1),.b(g11),.s(s01),.clk(clk));
comp c0(.in1(s00),.in2(s01),.out(ad_0),.clk(clk));

//S1
adder ad10(.a(a3),.b(g30),.s(s10),.clk(clk));
adder ad11(.a(a2),.b(g21),.s(s11),.clk(clk));
comp c1(.in1(s10),.in2(s11),.out(ad_1),.clk(clk));

//S2
adder ad20(.a(a4),.b(g40),.s(s20),.clk(clk));
adder ad21(.a(a5),.b(g51),.s(s21),.clk(clk));
comp c2(.in1(s20),.in2(s21),.out(ad_2),.clk(clk));

//S3
adder ad30(.a(a7),.b(g70),.s(s30),.clk(clk));
adder ad31(.a(a6),.b(g71),.s(s31),.clk(clk));
comp c3(.in1(s30),.in2(s31),.out(ad_3),.clk(clk));

//S4
adder ad40(.a(a1),.b(g10),.s(s40),.clk(clk));
adder ad41(.a(a0),.b(g01),.s(s41),.clk(clk));
comp c4(.in1(s40),.in2(s41),.out(ad_4),.clk(clk));

//S5
adder ad50(.a(a2),.b(g20),.s(s50),.clk(clk));
adder ad51(.a(a3),.b(g31),.s(s51),.clk(clk));
comp c5(.in1(s50),.in2(s51),.out(ad_5),.clk(clk));

//S6
adder ad60(.a(a5),.b(g50),.s(s60),.clk(clk));
adder ad61(.a(a4),.b(g41),.s(s61),.clk(clk));
comp c6(.in1(s60),.in2(s61),.out(ad_6),.clk(clk));

//S7
adder ad70(.a(a6),.b(g60),.s(s70),.clk(clk));
adder ad71(.a(a7),.b(g71),.s(s71),.clk(clk));
comp c7(.in1(s70),.in2(s71),.out(ad_7),.clk(clk));


endmodule
