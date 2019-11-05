module ClockSep(quickclk,reset,outclk);
	input quickclk,reset;
	output reg outclk;
	
	reg [3:0] count;
	
	initial begin
	count<=4'd0;
	outclk <=0;
	end
	
	always @(posedge quickclk or negedge reset) begin
		if (reset==0) begin count<=4'd0; outclk<=0;end
		else begin
			count<=count+1;
			if (count==4'd15) begin outclk<=~outclk; end
		end
	end
		
endmodule