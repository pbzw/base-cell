module FIFO(
input clk,
input rst,
input put,
input get,
input [7:0]put_data,

output full,
output empty,
output allmost_full,
output allmost_empty,
output [7:0]get_data

);

reg [7:0]mem[0:511];

wire [8:0]write_address;
wire [8:0]read_address;
wire [8:0]data_count;

assign get_data=mem[read_address];
assign full=(data_count>=9'd16);
assign allmost_full=(data_count>=9'd15);
assign empty=(data_count==9'd0);
assign allmost_empty=(9'd1>=data_count);

 up_counter_9bits write_address_count(
.clk(clk),
.rst(rst),
.en(put),
.count(write_address)
);


 up_counter_9bits read_address_count(
.clk(clk),
.rst(rst),
.en(get),
.count(read_address)
);

acc_counter_9bits data_counter(
.clk(clk),
.rst(rst),
.add(put),
.sub(get),
.count(data_count)
);

always @(posedge clk)
begin
	if(put)
	mem[write_address]=put_data;
end

endmodule

module up_counter_9bits(
input clk,
input rst,
input en,
output reg[8:0] count
);
always@(posedge clk)
begin
	if(rst)
	count<=9'd0;
	else if(en)
	count<=count+9'b1;
end

endmodule

module acc_counter_9bits(
input clk,
input rst,
input add,
input sub,
output reg[8:0] count
);

reg [8:0]count_new;

always@(posedge clk)
begin
	if(rst)
	count<=9'd0;
	else 
	count<=count_new;
end

always@(*)
begin
	case({add,sub})
	2'b00:count_new<=count;
	2'b01:count_new<=count-9'd1;
	2'b10:count_new<=count+9'd1;
	2'b11:count_new<=count;
	default
	count_new<=count;
	endcase

end

endmodule
