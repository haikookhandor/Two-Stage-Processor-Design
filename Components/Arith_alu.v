`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2022 17:16:30
// Design Name: 
// Module Name: Arith_alu
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


module Arith_alu(clk,reset,aluin1,aluin2,aluoperation,aluopselect,enable,aluout);
  input clk,reset,enable;
  input [31:0] aluin1,aluin2;
  input [2:0] aluoperation,aluopselect;
  output reg [32:0]aluout;
  reg h_carry;
  reg [15:0]h_add;
  
  always@(posedge clk,posedge reset)
    begin
      if(!reset)
      begin
      if(enable)
      begin
          if(aluopselect == 3'b001 && aluoperation == 3'b000)
            aluout = aluin1 + aluin2;
          else if(aluopselect == 3'b001 && aluoperation == 3'b001)
            begin
              {h_carry,h_add[15:0]} = aluin1[15:0] + aluin2[15:0];
              if(h_carry==0)
                aluout[32:16]=16'b0;
              else
                aluout[32:16]=16'b1;
            end
          else if(aluopselect == 3'b001 && aluoperation == 3'b010)
            begin
            aluout = aluin1 - aluin2;
            end
          else if(aluopselect == 3'b001 && aluoperation == 3'b011)
            begin
            aluout=~aluin2;
            aluout[32]=0;
            end
          else if(aluopselect == 3'b001 && aluoperation == 3'b100)
            aluout = aluin1 & aluin2;
          else if(aluopselect == 3'b001 && aluoperation == 3'b101)
            aluout = aluin1 | aluin2;
          else if(aluopselect == 3'b001 && aluoperation == 3'b110)
            aluout = aluin1 ^ aluin2;
          else if(aluopselect == 3'b001 && aluoperation == 3'b111)
            begin
            aluout[31:16] = aluin2[15:0];
          	aluout[15:0] = 16'h0;
              aluout[32]=0;
            end
          else if(aluopselect == 3'b101 && aluoperation ==3'b000)
            begin
            aluout[7:0]=aluin2[7:0];
            if(aluin2[7]==0)
              aluout[31:8]=24'b0;
            else
              aluout[31:8]=24'b1;
              aluout[32] = 0;
            end
          else if(aluopselect == 3'b101 && aluoperation ==3'b100)
            begin
            aluout[7:0]=aluin2[7:0];
              aluout[31:8]=24'b0;
              aluout[32] = 0;
            end
          else if(aluopselect == 3'b101 && aluoperation ==3'b001)
            begin
            aluout[15:0]=aluin2[15:0];
            if(aluin2[15]==0)
                aluout[31:16]=16'b0;
            else
                aluout[31:16]=16'b1;
              aluout[32] = 0;
            end
          else if(aluopselect == 3'b101 && aluoperation ==3'b101)
            begin
            aluout[15:0]=aluin2[15:0];
              aluout[31:16]=16'b0;
              aluout[32] = 0;
            end
          else if(aluopselect == 3'b101 && aluoperation ==3'b011)
            begin
            aluout=aluin2;
             aluout[32] = 0;
            end
          else
            begin
            aluout=aluin2;
            aluout[32] = 0;
            end
        end
        end
      else
        aluout=0;
      	
    end
endmodule
