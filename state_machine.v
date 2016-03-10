`define idle   4'b0000
`define finish 4'b0001
`define busy   4'b0010

module state_machine(
input clk,
input rst,
input start,
output busy,
output done
);

reg [3:0]state;
reg[3:0]nstate;


always@(posedge clk,posedge rst)
begin
	if(rst)
	state=`idle;
	else
	state<=nstate;
end

always@(*)
begin
	case(state)
	`idle:begin
			if(start)
			nstate=`busy;
			else
			nstate=`idle;
			end
	`busy:begin
			if(all)
			nstate=`finish;
			else
			nstate=`busy;
			end
	`finish:nstate=`finish;
	endcase
end