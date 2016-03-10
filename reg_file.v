module reg_file #(parameter WIDTH = 32,parameter DEPTH = 32)(
input clk,
input rst,
input we,
input [5:0]select,
input [WIDTH-1:0]write_data,
output [WIDTH-1:0] read_out
);
integer i;
parameter zero={(WIDTH){1'b0}};

reg [WIDTH-1:0]file[DEPTH-1:0];

assign read_out=file[select];

always @(posedge clk,posedge rst)
begin
	if(rst)
	for(i=0;i<DEPTH;i=i+1)
		file[i]=zero;
	else if(we)
		file[select]=write_data;
end



endmodule