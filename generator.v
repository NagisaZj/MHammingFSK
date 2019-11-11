module generator(clk,reset,code,send);

input wire clk;
input wire reset;
output [10:0]code;
output reg send;


wire mdata;
reg [2:0]count;
reg [6:0]cachedata;
reg [6:0] data;

generate_m generate_m(clk,reset,mdata);


initial begin 
	cachedata<=7'b0;
	count<=3'b0;
	send<=0;
	data<=7'b0;
end

always@(posedge clk or negedge reset)
begin
	if(reset == 0)
	begin
	cachedata<=7'b0;
	count<=3'b0;
	send<=0;
	data<=7'b0;
	end
	else
	begin
		cachedata = {cachedata[5:0],mdata};
		count<=count+1;
	end
	if (count==3'b111)
	begin
		count<=3'b000;
		data<=cachedata;
		//send<=1;
	end
	if (count==3'b001)
	begin
		send<=1;
	end
	if (count==3'b010)
	begin
		send<=0;
	end
end

/*always@ (posedge send)
begin
	data<=cachedata;
end*/

HammingEncoder HammingEncoder(data,code);

endmodule