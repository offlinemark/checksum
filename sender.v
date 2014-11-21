`timescale 1 ns / 1 ns

module sender(data, out);

/* Args */
input [31:0] data;
output [47:0] out;

wire [15:0] calculated;

checksum C(data, calculated);

assign out = {data, calculated};

endmodule
