`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 15:16:24
// Design Name: 
// Module Name: gama_ROM
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


module gama_ROM(g00,g01,g10,g11,g20,g21,g30,g31,g40,g41,g50,g51,g60,g61,g70,g71,clk);
input clk;
output reg signed [15:0] g00,g01,g10,g11,g20,g21,g30,g31,g40,g41,g50,g51,g60,g61,g70,g71;

 reg [15:0]data[0:15];
 initial begin
    data[0] = 16'd5; //g00
    data[1] = 16'd4; //g10
    data[2] = 16'd1; //g20
    data[3] = 16'd10; //g30
    data[4] = 16'd15; //g40
    data[5] = 16'd3; //g50
    data[6] = 16'd2; //g60
    data[7] = 16'd2; //g70
    data[8] = 16'd6; //g01
    data[9] = 16'd11; //g11
    data[10] = 16'd7; //g21
    data[11] = 16'd9; //g31
    data[12] = 16'd13; //g41
    data[13] = 16'd17; //g51
    data[14] = 16'd14; //g61
    data[15] = 16'd6; //g71
    end
    
    
    always @(posedge clk)
        begin
            g00 <= data[0];
            g10 <= data[1];
            g20 <= data[2];
            g30 <= data[3];
            g40 <= data[4];
            g50 <= data[5];
            g60 <= data[6];
            g70 <= data[7];
            g01 <= data[8];
            g11 <= data[9];
            g21 <= data[10];
            g31 <= data[11];
            g41 <= data[12];
            g51 <= data[13];
            g61 <= data[14];
            g71 <= data[15];
            
        end
endmodule
