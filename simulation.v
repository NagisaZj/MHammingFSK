module simulation();

reg clk;
reg reset;
wire [10:0] code;
wire send;

initial 
begin
reset<=1;
clk<=0;
#100 reset<=0;
#100 reset<=1;
end

always #400 clk=~clk;
generator generator(clk,reset,code,send);

endmodule