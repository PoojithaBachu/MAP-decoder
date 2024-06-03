`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 19:52:08
// Design Name: 
// Module Name: cont_fwd
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


module cont_fwd(clk,rst,w_r,ad_addr,count,done_count,done_fwd,count_main,stop);
input clk,rst;
input [3:0] count, done_count;
input [7:0] count_main;
output reg w_r,done_fwd,stop;
output reg [7:0] ad_addr;

reg [3:0] state;
parameter S0 = 4'b0000,
          S1 = 4'b0001,
          S2 = 4'b0010,
          S3 = 4'b0011,
          S4 = 4'b0100,
          S5 = 4'b0101,
          S6 = 4'b0110,
          S7 = 4'b0111,
          S8 = 4'b1000;
          
always @(posedge clk)
    begin
        if(rst)
            begin
                state <=S0;
                
            end
            
        else
            begin
                case(state)
                    S0: begin //read data from alpha_SRAM
                          w_r <=0;
                          ad_addr <= 8'b000000;
                          state<= S1;  
                        end
                    S1: begin  //addition 
                        state<=S2;
                        end
                        
                    S2: begin  //comparison
                        state<=S3;
                        
                        end
                        
                    S3: begin  //write alpha' to SRAM
                            ad_addr <= ad_addr+8;
                            w_r <=1;
                            state <= S4;
                        end
                        
                    S4: begin
                        w_r <=0;
                        if(done_count<4'd7)
                            begin
                                state<=S1;
                            end
                        else
                            state<=S5;
                        end
                        
                   S5 : begin
                            done_fwd <=1;
                            state<=S6;
                        end
                   S6:begin
                            done_fwd <=0;
                            if(count_main ==8'd68)
                                begin
                                    state <= S7;
                                    ad_addr <= 8'd8; //read first stage alpha values
                                end
                            else
                                state<=S6;
                      end
                  S7 : begin
                            ad_addr <= ad_addr + 8;  //read alpha values from 2nd stage
                            if(count_main ==8'd79)
                                begin
                                    state<=S8;
                                end
                            else 
                                state<=S7;
                       end
                  S8: begin
                        stop <=1'b1;
                      end
                        
                   
                        
                endcase
            
            
            end
    
    end


endmodule
