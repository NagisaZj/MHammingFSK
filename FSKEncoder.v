module FSKEncoder(codein,sending,clk,reset,FSKout);
	input  codein;
	input clk,sending,reset;
	output reg FSKout;
	
	
	reg carry1,carry2;
	reg [2:0] count;
	
	
	initial begin
		carry1<=0;
		carry2<=0;
		count<=3'd0;
	end
	
	always @(posedge sending) begin
		carry1<=1;
		carry2<=1;
		count<=3'd0;
	end
	
	/*assign FSKout = (sending == 0) ?0:
					 (codein == 1) ? carry1:carry2;*/
					 
	always @(posedge clk) begin
		if (sending ==0) FSKout<=0;
		else begin
			if (codein==1) FSKout<=carry1;
			else FSKout<=carry2;
		end
	end
	
	always @(posedge clk or negedge reset) begin
		if (reset==0)
			begin 
				carry1<=0;
				carry2<=0;
				count<=3'd0;
			end
		else begin
		case (count)
		3'd3: begin  carry1<=~carry1; end
		3'd7: 
			begin
				carry1<=~carry1;
				carry2<=~carry2;
			end
		endcase
		end
		count<=count + 1;
	end
	
		
		
endmodule