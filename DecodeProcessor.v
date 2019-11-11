module DecodeProcessor (decodeout,sending,clk,reset,decodeoutseq,refresh);
	input decodeout,sending,clk,reset;
	output reg [10:0] decodeoutseq;
	output reg refresh;
	
	reg [4:0] clkcnt;
	reg receiving;
	reg [3:0] index;
	
	
	initial begin
		decodeoutseq<=11'd0;
		clkcnt<=5'd0;
		receiving<=0;
		index<=4'd0;
		refresh<=0;
	end
	
	always @(negedge reset) begin
		decodeoutseq<=11'd0;
		clkcnt<=5'd0;
		receiving<=0;
		index<=4'd0;
		refresh<=0;
	end
	
	always @(posedge sending) begin
		receiving<=1;
		index<=4'd0;
		clkcnt<=5'd7;
		refresh<=0;
	end
	
	always @(posedge clk) begin
		if (receiving==1) begin
			clkcnt<=clkcnt+1;
			if (clkcnt==5'd16) begin
				decodeoutseq[index] <= decodeout;
			end
			else if (clkcnt==5'd24) begin
				/*decodeoutseq[index] <= decodeout;*/
				clkcnt<=5'd8;
				index<=index+1;
				if (index==4'd11) begin
					receiving<=0;
					refresh<=1;
				end
			end
		end
	end
	
endmodule