`timescale 1 ns / 1 ns

module receiver(data, ok);

/* Args */
input [47:0] data;
output ok;

wire [15:0] calculated;

inet_chksum C(data[47:16], calculated);

assign ok = checksum == calculated;

endmodule
