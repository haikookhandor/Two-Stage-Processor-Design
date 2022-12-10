`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2022 20:29:58
// Design Name: 
// Module Name: final
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


module final(
    input clk,
    input reset,
    input enable_ex,
    input [31:0] src1,
    input [31:0] src2,
    input [31:0] imm,
    input [6:0] control_in,
    input [31:0] mem_data_read_in,
    output mem_data_wr_en,
    output [31:0]mem_data_write_out,
    output reg [31:0] aluout,
    output carry
    );
    
    wire [31:0] aluin1;
    wire [31:0] aluin2;    
    wire [2:0] operation_out;
    wire [2:0] opselect_out;
    wire [4:0] shift_number;
    wire enable_arith;
    wire enable_shift;
    wire [31:0]shift_ans;
    wire [32:0] alu_ans;
    
    st1 a1(clk,reset,enable_ex,src1,src2,imm,control_in,mem_data_read_in,
    mem_data_wr_en,mem_data_write_out,aluin1,aluin2,operation_out,opselect_out,enable_arith,enable_shift,shift_number);
    
    AluShift a2(enable_shift,clk,reset,shift_ans,opselect_out,aluin1,operation_out);
    Arith_alu a3(clk,reset,aluin1,aluin2,operation_out,opselect_out,enable_arith,alu_ans);
    
    always@(posedge clk)
    begin
    if(enable_arith)
    aluout<=alu_ans;
    else
    aluout<=shift_ans;            
    end
    
    assign carry=alu_ans[32];    
    
    
    
    
    
    
    
    
endmodule
