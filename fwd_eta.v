`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2024 20:03:02
// Design Name: 
// Module Name: fwd_eta
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


module fwd_eta(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,clk,rst,e00,e10,e20,e30,e40,e50,e60,e70,e01,e11,e21,e31,e41,e51,e61,e71);
input signed [15:0] a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7;
input clk,rst;

output reg signed [15:0] e00,e10,e20,e30,e40,e50,e60,e70,e01,e11,e21,e31,e41,e51,e61,e71;
wire signed [15:0]g00,g01,g10,g11,g20,g21,g30,g31,g40,g41,g50,g51,g60,g61,g70,g71;
gama_ROM gama(.clk(clk),.g00(g00),.g10(g10),.g20(g20),.g30(g30),.g40(g40),.g50(g50),.g60(g60),.g70(g70),.g01(g01),.g11(g11),.g21(g21),.g31(g31),.g41(g41),.g51(g51),.g61(g61),.g71(g71));

always @(posedge clk)
    begin
        if(!rst)
            begin
                e00 = a0 + b0 + g00;
                e10 = a1 + b1 + g10;
                e20 = a2 + b2 + g20;
                e30 = a3 + b3 + g30;
                e40 = a4 + b4 + g40;
                e50 = a5 + b5 + g50;
                e60 = a6 + b6 + g60;
                e70 = a7 + b7 + g70;
                
                e01 = a0 + b0 + g01;
                e11 = a1 + b1 + g11;
                e21 = a2 + b2 + g21;
                e31 = a3 + b3 + g31;
                e41 = a4 + b4 + g41;
                e51 = a5 + b5 + g51;
                e61 = a6 + b6 + g61;
                e71 = a7 + b7 + g71;
                
                
            end
    
    end
endmodule
