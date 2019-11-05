module simulation();

reg clk;
reg quickclk;
reg reset;
reg [10:0] code;
wire send;
wire codeout;

initial 
begin
reset<=1;
clk<=0;
quickclk<=0;
#100 reset<=0;
#100 reset<=1;
code = 11'b11100011100;
end

always #400 clk=~clk;
always #10 quickclk=~quickclk;
FSKEncoder FSKEncoder(code,send,quickclk,reset,codeout);

endmodule