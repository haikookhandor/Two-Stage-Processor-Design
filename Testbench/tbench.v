`timescale 1ns / 1ps

module tbench;
reg clk,reset,enable_ex;
reg [31:0] src1,src2,imm,mem_data_read_in;
reg [6:0] control_in;
wire mem_data_wr_en;
wire [31:0]mem_data_write_out,aluout;
wire carry;

final f1(clk,reset,enable_ex,src1,src2,imm,mem_data_read_in,control_in,mem_data_wr_en,mem_data_write_out,aluout,carry);
initial
begin
reset=1;
clk=0;
enable_ex=1;
src1=5756;
src2=423523;
imm=346436;
mem_data_read_in=534534;
control_in=34;
#2;

reset=0;
clk=0;
enable_ex=1;
src1=5421;
src2=424234;
imm=34654;
mem_data_read_in=345;
control_in=12;
#2;

reset=0;
enable_ex=1;
src1=60;
src2=89;
imm=332;
mem_data_read_in=532;
control_in=5;
#2;

reset=0;
enable_ex=1;
src1=89;
src2=123;
imm=234;
mem_data_read_in=55435;
control_in=6;
#2;

reset=0;
enable_ex=1;
src1=99;
src2=490;
imm=3412;
mem_data_read_in=531;
control_in=323;
#2;

reset=0;
enable_ex=1;
src1=589;
src2=4298;
imm=3476;
mem_data_read_in=509;
control_in=8;
#2;

reset=0;
enable_ex=1;
src1=56;
src2=47;
imm=34;
mem_data_read_in=534;
control_in=39;
#2;

reset=0;
enable_ex=1;
src1=57;
src2=4523;
imm=3436;
mem_data_read_in=534;
control_in=4;
#2;

reset=0;
enable_ex=1;
src1=56;
src2=4523;
imm=3436;
mem_data_read_in=5334;
control_in=54;
#2;

end
always
#1
clk=~clk;
endmodule
