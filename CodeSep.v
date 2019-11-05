module CodeSep(codein,send,clk,reset,codeout,sending);
	input [10:0] codein;
	input clk,send,reset;
	output reg codeout,sending;
	
	reg [3:0] count;
	reg [3:0] indexnowsend;
	reg [10:0] coderem;
	
	
	initial begin
		count<=4'd0;
		indexnowsend<=4'd0;
		coderem<=11'd0;
		sending<=0;
		codeout<=0;
	end
		
	
	always @(posedge send) begin
		sending<=1;
		codeout<=codein[0];
		indexnowsend<=4'd0;
		count<=4'd0;
		coderem<=codein;
	end
	
	
	always @(posedge clk or negedge reset) begin
		if (reset==0)
			begin 
				count<=4'd0;
				indexnowsend<=4'd0;
				coderem<=11'd0;
				sending<=0;
				codeout<=0;
			end
		else begin
		if (count==4'd15)
			begin
				indexnowsend=indexnowsend+1;
				if (indexnowsend>10)
					begin sending <=0; end
				else begin if (sending == 1) begin codeout<=codein[indexnowsend]; end end
			end
		end
		count<=count + 1;
	end
	
		
		
endmodule