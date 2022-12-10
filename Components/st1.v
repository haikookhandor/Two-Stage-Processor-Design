`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2021 20:10:59
// Design Name: 
// Module Name: st1
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


module st1(
    input clk,
    input reset,
    input enable_ex,
    input [31:0]src1,
    input [31:0]src2,
    input [31:0]imm,
    input [6:0]control_in,
    input [31:0]mem_data_read_in,
    output reg mem_data_wr_en,
    output [31:0] mem_data_write_out,
    output reg [31:0] aluin1,
    output reg [31:0] aluin2,
    output reg [2:0]operation_out,
    output reg [2:0]opselect_out,
    output reg enable_arith,
    output reg enable_shift,
    output reg [4:0]shift_number
    );
    
    assign mem_data_write_out=src2;
    
    always@(control_in[3:0])
    begin
        if(control_in[2:0]==4 && control_in[3]==1)
            mem_data_wr_en<=1;
        else
            mem_data_wr_en<=0;            
        
    end   
    
    
    
    always@(posedge clk, posedge reset)
    begin
        if(reset)
            aluin1<=0;
        else if(enable_ex)
            aluin1<=src1;        
    end
    
    always@(posedge clk, posedge reset)
    begin
        if(reset)
            aluin2<=0;
        else if(enable_ex)
            begin
                if(control_in[2:0]==1 && control_in[3]==1'b0)
                    aluin2<=src2;
                else if(control_in[2:0]==1 && control_in[3]==1'b1)
                    aluin2<=imm;
                else if(control_in[2:0]==5 && control_in[3]==1'b1)
                    aluin2<=mem_data_read_in;               
            end
    end
    
    always@(posedge clk,posedge reset)
    begin
        if(reset)
            operation_out<=0;
        else if(enable_ex)
            operation_out<=control_in[6:4];
            
    end
    
    always@(posedge clk,posedge reset)
    begin
        if(reset)
            opselect_out<=0;
        else if(enable_ex)
            opselect_out<=control_in[2:0];
                        
    end
    
    always@(posedge clk,posedge reset)
    begin
        if(reset)
            shift_number<=0;
        else
        begin
            if(!enable_ex)
                shift_number<=0;
            else
            begin
                if(control_in[2:0]==0 && imm[2]==0)
                    shift_number<=imm[10:6];
                else if(control_in[2:0]==0 && imm[2]==1)
                    shift_number<=src2[4:0];
            end
                
        end
    end
    
    always@(posedge clk, posedge reset)
    begin
        if(reset)
            enable_arith<=0;
        else
        begin
            if(!enable_ex)
                enable_arith<=0;
            else
                if((control_in[2:0]==1)||(control_in[2:0]==5 && control_in[3]==1))
                    enable_arith<=1;
                else if((control_in[2:0]==5 && control_in[3]==0))
                    enable_arith<=0;
        end
    end
    
    always@(posedge clk,posedge reset)
        if(reset)
            enable_shift<=0;
            
        else
        begin
            if(!enable_ex)
                enable_shift<=0;
            else if(control_in[2:0]==0)
                enable_shift<=1;
        end
    
    
    
endmodule
