module acc #(parameter WIDTH = 32)(
input clk,
input rst,
input en,
input [7:0]in,
output reg[WIDTH-1:0] count
);

wire [15:0]extend_in;
assign extend_in={8'b0,in};

always@(posedge clk)
begin
	if(rst)
	count<=16'd0;
	else if(en)
	count<=count+in;
end

endmodule