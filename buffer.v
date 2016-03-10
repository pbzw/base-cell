module buffer #(parameter WIDTH = 32)(
input clk,
input rst,
input en,
input[WIDTH-1:0] data_in,
output reg[WIDTH-1:0] data_out
);
parameter zero={(WIDTH){1'b0}};


always@(posedge clk)
begin
	if(rst)
	data_out<=zero;
	else if(clr)
	data_out<={{(WIDTH){1'b0}}};
	else if(en)
	data_out<=data_in;
end

endmodule