module generate_m(clk,reset,data);
input wire clk;
input wire reset;
output wire data;

reg [2:0]register;
wire update;

assign data = register[0];
assign update = register[0]^register[2];

always@(posedge clk or negedge reset)
begin
	if(reset==0)
	begin
		register<='b100;
	end
	
	else
	begin
		register<={update,register[2:1]};
	end
end

endmodule