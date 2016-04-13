module FIFO#(parameter WIDTH = 32,parameter DEPTH = 64)(
input clk,
input rst,
input put,
input get,
input [WIDTH-1:0]put_data,

output full,
output empty,
output [WIDTH-1:0]get_data

);

reg [WIDTH-1:0]mem[0:DEPTH-1];

wire [$clog2(DEPTH)-1:0]write_address;
wire [$clog2(DEPTH)-1:0]read_address;

assign get_data=mem[read_address];
assign full=(write_address+{{$clog2(DEPTH)-1{1'b0}},1'b1}==read_address);
assign empty=(write_address==read_address);

 up_counter #(.WIDTH ($clog2(DEPTH)))  write_address_count(
.clk(clk),
.rst(rst),
.en(put),
.count(write_address)
);


 up_counter #(.WIDTH ($clog2(DEPTH))) read_address_count(
.clk(clk),
.rst(rst),
.en(get),
.count(read_address)
);


always @(posedge clk)
begin
	if(put)
	mem[write_address]=put_data;
end

endmodule
