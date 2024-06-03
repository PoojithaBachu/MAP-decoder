`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2024 23:18:47
// Design Name: 
// Module Name: one_stage_bck
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


module one_stage_bck(clk,rst,bd_addr,b0,b1,b2,b3,b4,b5,b6,b7,w_r_b,a0,a1,a2,a3,a4,a5,a6,a7);
output signed [15:0] b0,b1,b2,b3,b4,b5,b6,b7;
input clk,rst,w_r_b;
input [7:0] bd_addr;
input signed [15:0] a0,a1,a2,a3,a4,a5,a6,a7;


wire signed [15:0] bd_0,bd_1,bd_2,bd_3,bd_4,bd_5,bd_6,bd_7;
wire signed [15:0]g00,g01,g10,g11,g20,g21,g30,g31,g40,g41,g50,g51,g60,g61,g70,g71;
wire signed [15:0] sb00,sb01,sb10,sb11,sb20,sb21,sb30,sb31,sb40,sb41,sb50,sb51,sb60,sb61,sb70,sb71;
gama_ROM gama(.clk(clk),.g00(g00),.g10(g10),.g20(g20),.g30(g30),.g40(g40),.g50(g50),.g60(g60),.g70(g70),.g01(g01),.g11(g11),.g21(g21),.g31(g31),.g41(g41),.g51(g51),.g61(g61),.g71(g71));
beta_SRAM beta_mem(.clk(clk),.rst(rst),.write_read_bck(w_r_b),.addr_b(bd_addr),.in_data0(bd_0),.in_data1(bd_1),.in_data2(bd_2),.in_data3(bd_3),.in_data4(bd_4),.in_data5(bd_5),.in_data6(bd_6),.in_data7(bd_7),.out_data0(b0),.out_data1(b1),.out_data2(b2),.out_data3(b3),.out_data4(b4),.out_data5(b5),.out_data6(b6),.out_data7(b7),.a0(a0),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.a6(a6),.a7(a7));

//S0 
adder bd00(.a(b0),.b(g00),.s(sb00),.clk(clk));
adder bd01(.a(b4),.b(g41),.s(sb01),.clk(clk));
comp cb0(.in1(sb00),.in2(sb01),.out(bd_0),.clk(clk));

//S1
adder bd10(.a(b4),.b(g40),.s(sb10),.clk(clk));
adder bd11(.a(b0),.b(g01),.s(sb11),.clk(clk));
comp cb1(.in1(sb10),.in2(sb11),.out(bd_1),.clk(clk));

//S2
adder bd20(.a(b5),.b(g50),.s(sb20),.clk(clk));
adder bd21(.a(b1),.b(g11),.s(sb21),.clk(clk));
comp cb2(.in1(sb20),.in2(sb21),.out(bd_2),.clk(clk));

//S3
adder bd30(.a(b1),.b(g10),.s(sb30),.clk(clk));
adder bd31(.a(b5),.b(g51),.s(sb31),.clk(clk));
comp cb3(.in1(sb30),.in2(sb31),.out(bd_3),.clk(clk));

//S4
adder bd40(.a(b2),.b(g20),.s(sb40),.clk(clk));
adder bd41(.a(b6),.b(g61),.s(sb41),.clk(clk));
comp cb4(.in1(sb40),.in2(sb41),.out(bd_4),.clk(clk));

//S5
adder bd50(.a(b6),.b(g60),.s(sb50),.clk(clk));
adder bd51(.a(b2),.b(g21),.s(sb51),.clk(clk));
comp cb5(.in1(sb50),.in2(sb51),.out(bd_5),.clk(clk));

//S6
adder bd60(.a(b7),.b(g70),.s(sb60),.clk(clk));
adder bd61(.a(b3),.b(g71),.s(sb61),.clk(clk));
comp cb6(.in1(sb60),.in2(sb61),.out(bd_6),.clk(clk));

//S7
adder bd70(.a(b3),.b(g30),.s(sb70),.clk(clk));
adder bd71(.a(b7),.b(g71),.s(sb71),.clk(clk));
comp cb7(.in1(sb70),.in2(sb71),.out(bd_7),.clk(clk));


endmodule
