`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2024 00:05:05
// Design Name: 
// Module Name: beta_SRAM
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


module beta_SRAM(a0,a1,a2,a3,a4,a5,a6,a7,write_read_bck,in_data0,in_data1,in_data2,in_data3,in_data4,in_data5,in_data6,in_data7,out_data0,out_data1,out_data2,out_data3,out_data4,out_data5,out_data6,out_data7,clk,addr_b,write_done,read_done,rst);
parameter addr_width = 7;
parameter mem_width = 71;
parameter data_width =15;
input signed [data_width:0]in_data0,in_data1,in_data2,in_data3,in_data4,in_data5,in_data6,in_data7;
input clk,rst,write_read_bck;
input [addr_width:0] addr_b;
output reg signed [data_width:0] out_data0,out_data1,out_data2,out_data3,out_data4,out_data5,out_data6,out_data7;
output reg write_done,read_done;
input signed [15:0] a0,a1,a2,a3,a4,a5,a6,a7;

reg [data_width:0] mem[0:mem_width];



always@(posedge clk)
    begin
        if(rst)
            begin
                write_done<=0;
                read_done <= 0; 
                mem[mem_width] <=a7; mem[mem_width-1] <=a6 ; mem[mem_width-2] <= a5; mem[mem_width-3] <= a4;
                mem[mem_width-4] <= a3; mem[mem_width-5] <= a2; mem[mem_width-6] <= a1; mem[mem_width-7] <= a0;
                  
            end
        else if(write_read_bck) //write_read = 1; write data into SRAM
            begin
               mem[addr_b] <= in_data0;
               mem[addr_b+1] <= in_data1;
               mem[addr_b+2] <= in_data2;
               mem[addr_b+3] <= in_data3;
               mem[addr_b+4] <= in_data4;
               mem[addr_b+5] <= in_data5;
               mem[addr_b+6] <= in_data6;
               mem[addr_b+7] <= in_data7;
               write_done <=1;
            end
        else
            begin
                out_data0 <= mem[addr_b];
                out_data1 <= mem[addr_b+1];
                out_data2 <= mem[addr_b+2];
                out_data3 <= mem[addr_b+3];
                out_data4 <= mem[addr_b+4];
                out_data5 <= mem[addr_b+5];
                out_data6 <= mem[addr_b+6];
                out_data7 <= mem[addr_b+7];
                read_done <= 1;
            end    
    end

endmodule
