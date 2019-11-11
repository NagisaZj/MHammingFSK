module FSKDecoder(coderecv,clk,reset,decodeout);
	input coderecv,clk,reset;
	output reg decodeout;
	

	reg [3:0] clkcnt;
	reg cntstate;
	
	wire coderecv2;
	assign coderecv2 = ~ coderecv;
	
	initial begin
		clkcnt<=4'd0;
		decodeout<=0;
		cntstate<=0;
	end
	
	always @(posedge coderecv or posedge coderecv2 or negedge reset) begin
		if (reset==0) begin 
			clkcnt<=4'd0;
			decodeout<=0;
			cntstate<=0;
			end
		else begin
			if (coderecv==1)
				cntstate<=1;
			else begin
				cntstate<=0;
				if (clkcnt<4'd7)
					decodeout<=1;
				else decodeout<=0;
			end
		end
	end
	
	always @(posedge clk) begin
		if (cntstate==1)
			clkcnt<=clkcnt+1;
		else clkcnt<=0;
	end


endmodule