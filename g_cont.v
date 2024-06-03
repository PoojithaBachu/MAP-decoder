`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2024 16:22:42
// Design Name: 
// Module Name: g_cont
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


module g_cont(w_r_gn,gn_addr,clk,rst,count_main,done_gama);
input clk,rst;
input [7:0] count_main;
output reg w_r_gn,done_gama;
output reg [7:0]gn_addr;

reg [2:0] state;
parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

always @(posedge clk)
    if(rst)
        state <= S0;
    else 
        case(state)
            S0 : begin
                    if(count_main == 8'd72)
                        begin
                            w_r_gn <= 1;
                            gn_addr <= 8'b00000000;
                            state<=S1;
                        end
                 end
            S1 : begin
                    gn_addr <= gn_addr +1;
                    if(count_main == 8'd79)
                        begin
                        state<= S2;
                        end
                    else
                        state <= S1;
                 end
            S2 : begin
                    w_r_gn <=0;
                    gn_addr <= 0;
                    state <= S3;
                  end
            S3 : begin
                    gn_addr <= gn_addr +1;
                    if(count_main == 8'd87)
                        begin
                            state<=S4;
                        end
                    else 
                        state<=S3;
                 end
            S4 : begin
                    done_gama <= 1'b1;
                 end
         endcase

endmodule
