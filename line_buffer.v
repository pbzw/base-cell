// Release date : 2016.06.19
// File         : line_buffer.v
// Project      : None
// For          : DICS summer Camp 2016
// Creator(s)   : Yang, Yu-Xiang (M10412034@yuntech.edu.tw)
// 
//
//
//  Description: 
//  Sample parameter line buffer code for FPGA
//

module line_buffer#(parameter WIDTH = 32,parameter DEPTH = 64)(
input clk,
input rst,
input en,
input [WIDTH-1:0]data_in,
output [WIDTH-1:0]data_out
);
reg [WIDTH-1:0]mem[0:DEPTH];
wire [WIDTH-1:0]write_counter_count,read_counter_count;

assign data_out=mem[(read_counter_count+1'b1)];

up_counter #(.WIDTH ($clog2(DEPTH))) write_counter(
.clk(clk),
.rst(rst),
.clr(1'b0),
.en(en),
.count(write_counter_count)
);

up_counter #(.WIDTH ($clog2(DEPTH))) read_counter(
.clk(clk),
.rst(rst),
.clr(1'b0),
.en(en),
.count(read_counter_count)
);

always @(posedge clk)
begin
mem[write_counter_count]<=data_in;
end

endmodule