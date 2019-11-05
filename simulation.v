module simulation();

reg quickclk;
reg reset;
wire [10:0] code;
wire send;
wire codeout;
wire outclk;
wire sending;
wire FSKout;
initial 
begin
reset<=1;
quickclk<=1;
#400 reset<=0;
#400 reset<=1;
end


always #10 quickclk=~quickclk;
ClockSep ClockSep(quickclk,reset,outclk);
generator generator(outclk,reset,code,send);
CodeSep CodeSep(code,send,quickclk,reset,codeout,sending);
FSKEncoder FSKEncoder(codeout,sending,quickclk,reset,FSKout);
endmodule