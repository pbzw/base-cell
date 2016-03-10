

module state_machine(
input clk,
input rst,
input start,
output busy,
output done
);

reg [3:0]state;
reg[3:0]nstate;
parameter idle=4'b0000;
parameter finish=4'b0001;
parameter busy  =4'b0010;

always@(posedge clk)
begin
	if(rst)
	state=idle;
	else
	state<=nstate;
end

always@(*)
begin
	case(state)
	idle:begin
			if(start)
			nstate=busy;
			else
			nstate=idle;
			end
	busy:begin
			if(all)
			nstate=finish;
			else
			nstate=busy;
			end
	finish:nstate=finish;
	endcase
end