`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2024 14:48:18
// Design Name: 
// Module Name: cont_bck
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


module cont_bck(clk,rst,w_r_b,bd_addr,count_bck,done_count_bck,done_bck,count_main,stop);
input clk,rst;
input [3:0] count_bck, done_count_bck;
input [7:0] count_main;
output reg w_r_b,done_bck,stop;
output reg [7:0] bd_addr;

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
                    
                    S0: begin // read data from beta_alapha
                            w_r_b <=0;
                            bd_addr <= 8'd64;
                            state<=S1;
                        end
                    S1: begin  //addition 
                        state<=S2;
                        end
                        
                    S2: begin  //comparison
                        state<=S3;
                        
                        end
                        
                    S3: begin  //write alpha' to SRAM
                            bd_addr <= bd_addr-8;
                            w_r_b <=1;
                            state <= S4;
                        end
                        
                    S4: begin
                        w_r_b <=0;
                        if(done_count_bck<4'd7)
                            begin
                                state<=S1;
                            end
                        else
                            state<=S5;
                        end
                        
                   S5 : begin
                            done_bck <=1;
                            state<=S6;
                        end
                   S6:begin
                            done_bck <=0;
                            if(count_main == 8'd69)
                                begin
                                    state<=S7;
                                    bd_addr <= 8'd8;
                                end
                            else
                                state<=S6;
                      end
                  S7: begin
                            bd_addr <= bd_addr+8;
                            if(count_main ==8'd79)
                                begin
                                    state<=S8;
                                end
                            else
                                state<=S7;
                      end
                      
                  S8 : begin
                            stop <=1'b1;
                       end
                        
                   
                endcase
            
            
            end
    
    end


endmodule
