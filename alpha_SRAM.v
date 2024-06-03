`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2024 15:44:21
// Design Name: 
// Module Name: alpha_SRAM
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


module alpha_SRAM(write_read,in_data0,in_data1,in_data2,in_data3,in_data4,in_data5,in_data6,in_data7,out_data0,out_data1,out_data2,out_data3,out_data4,out_data5,out_data6,out_data7,clk,addr,write_done,read_done,rst);
parameter addr_width = 7;
parameter mem_width = 71;
parameter data_width =15;
input signed [data_width:0]in_data0,in_data1,in_data2,in_data3,in_data4,in_data5,in_data6,in_data7;
input write_read,clk,rst;
input [addr_width:0] addr;
output reg signed [data_width:0] out_data0,out_data1,out_data2,out_data3,out_data4,out_data5,out_data6,out_data7;
output reg write_done,read_done;

reg [data_width:0] mem[0:mem_width];


always@(posedge clk)
    begin
        if(rst)
            begin
                write_done<=0;
                read_done <= 0; 
                mem[0] <=16'd0; mem[1] <= 16'd1; mem[2] <= 16'd2; mem[3] <= 16'd3;
                mem[4] <= 16'd4; mem[5] <= 16'd5; mem[6] <= 16'd6; mem[7] <= 16'd7;
                  
            end
        else if(write_read) //write_read = 1; write data into SRAM
            begin
               mem[addr] <= in_data0;
               mem[addr+1] <= in_data1;
               mem[addr+2] <= in_data2;
               mem[addr+3] <= in_data3;
               mem[addr+4] <= in_data4;
               mem[addr+5] <= in_data5;
               mem[addr+6] <= in_data6;
               mem[addr+7] <= in_data7;
               write_done <=1;
            end
        else
            begin
                out_data0 <= mem[addr];
                out_data1 <= mem[addr+1];
                out_data2 <= mem[addr+2];
                out_data3 <= mem[addr+3];
                out_data4 <= mem[addr+4];
                out_data5 <= mem[addr+5];
                out_data6 <= mem[addr+6];
                out_data7 <= mem[addr+7];
                read_done <= 1;
            end    
    end

endmodule
