`include "define.v"

module buffer #(parameter WIDTH = 32,reset=16'h3000)(
input clk,
input rst,
input en,
input[WIDTH-1:0] data_in,
output reg[WIDTH-1:0] data_out
);



always@(`clk_trigger_edge clk,`rst_trigger_edge rst)
begin
	if(`rst)
	data_out<=reset;
	else if(en)
	data_out<=data_in;
end

endmodule