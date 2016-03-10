//line_buffer 深度 64 寬8
module line_buffer(
input clk,
input rst,
input en,
input [7:0]data_in,
output [7:0]data_out
);
reg [7:0]mem[0:63];
wire [5:0]write_counter_count,read_counter_count;
assign data_out=mem[(read_counter_count+6'b1)];

up_counter #(.WIDTH (6)) write_counter(
.clk(clk),
.rst(rst),
.clr(1'b0),
.en(en),
.count(write_counter_count)
);

up_counter #(.WIDTH (6)) read_counter(
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