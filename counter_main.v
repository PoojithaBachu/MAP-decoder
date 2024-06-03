`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2024 19:35:14
// Design Name: 
// Module Name: counter_main
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


module counter_main(rst,clk,count_main,done_gama);
input clk,rst,done_gama;
output reg [7:0] count_main;

always @(posedge clk)
    begin
        if(rst)
            count_main<=0;
        else if(done_gama)
            count_main <= count_main;
        else
            count_main <= count_main+1;   
        
    end
endmodule
