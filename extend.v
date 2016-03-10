module extend #(parameter in_width=32,parameter out_width=32)
(
input[in_width-1:0] in,
output [out_width-1:0]out
);
assign out={{(out_width-in_width){1'b0},in};
endmodule