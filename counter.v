module up_counter #(parameter WIDTH = 32)(
input clk,
input rst,
input en,
input clr,
output reg[WIDTH-1:0] count
);
parameter zero={(WIDTH){1'b0}};


always@(posedge clk)
begin
	if(rst)
	count<=zero;
	else if(clr)
	count<={{(WIDTH-1){1'b0}},1'b1};
	else if(en)
	count<=count+{{WIDTH-1{1'b0}},1'b1};
end

endmodule
/*up_counter #(.WIDTH(6))(
.clk(clk),
.rst(rst),
.en(),
.clr(1'b0),
.count()
);*/