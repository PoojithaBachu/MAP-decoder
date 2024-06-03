`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2024 15:27:24
// Design Name: 
// Module Name: counter_bck
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


module counter_bck(clk,rst,count_bck,done_count_bck,done_bck);
input clk, rst,done_bck;
output reg [3:0] count_bck;
output reg [3:0] done_count_bck;

always @(posedge clk)
    begin
        if(rst) begin count_bck <=0;
                      done_count_bck <=0;
                end
                
        else count_bck = count_bck+1;
        if(count_bck == 4'd6)
            begin
            done_count_bck<=done_count_bck+1;
            count_bck <=4'd2;
            end
        if(done_bck)
            begin
                done_count_bck <=4'bXXXX;
                count_bck<=4'bXXXX;
            end
            
        
    end
endmodule
