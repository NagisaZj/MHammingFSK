module HammingDecoder(code,data);

input wire [10:0]code;
output wire [6:0]data;

wire [3:0]e;
wire [6:0]r;


assign e[3] = code[10]&&code[9]&&code[8]&&code[7]&&code[6]&&code[5]&&code[3];
assign e[2] = code[10]&&code[9]&&code[8]&&code[4]&&code[2];
assign e[1] = code[10]&&code[7]&&code[6]&&code[4]&&code[1];
assign e[0] = code[9]&&code[7]&&code[5]&&code[0];

assign r[6] = e==4'b1110;
assign r[5] = e==4'b1101;
assign r[4] = e==4'b1100;
assign r[3]= e==4'b1011;
assign r[2] = e==4'b1010;
assign r[1] = e==4'b1001;
assign r[0] = e==4'b0110;

assign  data = code[10:4]&&r;

endmodule