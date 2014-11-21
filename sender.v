`timescale 1 ns / 1 ns

module sender(data, out);

/* Args */
input [31:0] data;
output [47:0] out;

wire [15:0] calculated;

inet_chksum C(data, calculated);

assign out = {data, calculated};

endmodule
