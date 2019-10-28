module HammingEncoder(data,code);

input wire [6:0]data;
output wire [10:0]code;

assign code[10:4] = data;
assign code[3] = data[6]&&data[5]&&data[4]&&data[3]&&data[2]&&data[1];
assign code[2] = data[6]&&data[5]&&data[4]&&data[0];
assign code[1] = data[6]&&data[3]&&data[2]&&data[0];
assign code[0] = data[5]&&data[3]&&data[1];

endmodule