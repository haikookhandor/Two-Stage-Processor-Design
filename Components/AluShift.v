`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2022 17:12:53
// Design Name: 
// Module Name: AluShift
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

module AluShift(enable,clk,reset,aluout,shift_operation,aluin,shift);
input clk,reset,enable;
input [31:0] aluin;
input [2:0]shift;
input [2:0]shift_operation;
//output reg[31:0]aluout;
reg [31:0] ans;
output [31:0]aluout;

always@(posedge clk,posedge reset)
if(reset==1)
ans=32'b0;
else if(enable==1)
begin
case(shift_operation)
3'b000:ans=aluin<<shift;
3'b001:ans=aluin<<shift;
3'b010:ans=aluin>>shift;
3'b011:ans={aluin[31],aluin[30:0]>>shift};
endcase
end
assign aluout=ans;
endmodule
