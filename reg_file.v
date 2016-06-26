// Release date : 2016.06.19
// File         : reg_file.v
// Project      : None
// For          : DICS summer Camp 2016
// Creator(s)   : Yang, Yu-Xiang (M10412034@yuntech.edu.tw)
// 
//
//
//  Description: 
//   parameter line reg_file code 

`include "define.v"

module reg_file #(parameter WIDTH = 16,parameter DEPTH = 8)(
input clk,
input we,
input [$clog2(DEPTH)-1:0]read_reg1,read_reg2,
input [$clog2(DEPTH)-1:0]write_reg,
input [WIDTH-1:0]write_data,
output [WIDTH-1:0] read_out_1,
output [WIDTH-1:0] read_out_2
);
integer i;

parameter zero={(WIDTH){1'b0}};

reg [WIDTH-1:0]file[DEPTH-1:0];

assign read_out_1=file[read_reg1];
assign read_out_2=file[read_reg2];

always @(`clk_trigger_edge clk)
begin
	/*if(rst)
	for(i=0;i<DEPTH;i=i+1)
		file[i]=zero;
	else */if(we)
		file[write_reg]<=write_data;
end
endmodule