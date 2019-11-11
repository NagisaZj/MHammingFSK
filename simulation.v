module simulation();

reg quickclk;
reg reset;
wire [10:0] code;
wire send;
wire codeout;
wire outclk;
wire sending;
wire FSKout;
wire decoderes;
wire [10:0] codeoutseq;
wire refresh;
wire [6:0] hammingdecodeout;
initial 
begin
reset<=1;
quickclk<=1;
#100 reset<=0;
#100 reset<=1;
end


always #10 quickclk=~quickclk;
ClockSep ClockSep(quickclk,reset,outclk);
generator generator(outclk,reset,code,send);
CodeSep CodeSep(code,send,quickclk,reset,codeout,sending);
FSKEncoder FSKEncoder(codeout,sending,quickclk,reset,FSKout);
FSKDecoder FSKDecoder(FSKout,quickclk,reset,decoderes);
DecodeProcessor DecodeProcessor (decoderes,sending,quickclk,reset,codeoutseq,refresh);
HammingDecoder HammingDecoder(codeoutseq,hammingdecodeout);
endmodule