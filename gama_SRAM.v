`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2024 01:49:36
// Design Name: 
// Module Name: gama_SRAM
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


module gama_SRAM(g,gd,rst,w_r,clk,w_done,r_done,gama_addr);
input signed [15:0] g;
input rst,clk,w_r;
output reg signed [15:0] gd;
output reg w_done,r_done;
input [7:0] gama_addr;

reg [15:0] g_mem [0:7];
always @(posedge clk)
    begin
        if(rst)
            begin
                w_done<=0;
                r_done<=0;
            end
        else
            if(w_r)
                begin
                    g_mem[gama_addr] <= g;
                end
            else 
                begin
                    gd <= g_mem[gama_addr];
                end

    end
endmodule
