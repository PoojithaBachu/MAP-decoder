`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 19:45:26
// Design Name: 
// Module Name: counter
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


module counter(clk,rst,count,done_count,done_fwd);
input clk, rst,done_fwd;
output reg [3:0] count;
output reg [3:0] done_count;

always @(posedge clk)
    begin
        if(rst) begin count <=0;
                      done_count <=0;
                end
                
        else count = count+1;
        if(count == 4'd6)
            begin
            done_count<=done_count+1;
            count <=4'd2;
            end
        if(done_fwd)
            begin
                done_count <=4'bXXXX;
                count<=4'bXXXX;
            end
            
        
    end
endmodule
