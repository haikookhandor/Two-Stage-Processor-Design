`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2021 21:14:37
// Design Name: 
// Module Name: test1
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


module test1;
    reg clk;
    reg reset;
    reg enable_ex;
    reg [31:0]src1;
    reg [31:0]src2;
    reg [31:0]imm;
    reg [6:0]control_in;
    reg [31:0]mem_data_read_in;
    wire mem_data_wr_en;
    wire [31:0] mem_data_write_out;
    wire [31:0] aluin1;
    wire [31:0] aluin2;
    wire [2:0]operation_out;
    wire [2:0]opselect_out;
    wire enable_arith;
    wire enable_shift;
    wire [4:0]shift_number;
    
    st1 t1(.clk(clk),
        .reset(reset),
        .enable_ex(enable_ex),
        .src1(src1),
        .src2(src2),
        .imm(imm),
        .control_in(control_in),
        .mem_data_read_in(mem_data_read_in),
        .mem_data_wr_en(mem_data_wr_en),
        .mem_data_write_out(mem_data_write_out),
        .aluin1(aluin1),
        .aluin2(aluin2),
        .operation_out(operation_out),
        .opselect_out(opselect_out),
        .enable_arith(enable_arith),
        .enable_shift(enable_shift),
        .shift_number(shift_number));
    
    initial begin
        clk=0;
        forever
            #1 clk<=!clk;
        
    end
    
    initial begin
        reset=1;
        enable_ex=0;
        src1=0;
        src2=0;
        imm=0;
        control_in=0;
        mem_data_read_in=0;
        #1;
        reset=0;
        enable_ex=1;
        src1=0;
        src2=7;
        imm=5;
        control_in=7'b0100000;
        mem_data_read_in=0;
        #2;
        reset=0;
        enable_ex=1;
        src1=5;
        src2=0;
        imm=2;
        control_in=7'b0101000;
        mem_data_read_in=0;
        #2;
        reset=0;
        enable_ex=1;
        src1=0;
        src2=0;
        imm=0;
        control_in=7'b1000000;
        mem_data_read_in=0;
        #2;
        reset=0;
        enable_ex=1;
        src1=0;
        src2=0;
        imm=0;
        control_in=7'b1001000;
        mem_data_read_in=7;
        
    end
endmodule
