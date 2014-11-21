module receiver(data, checksum, ok);

/* Args */
input [31:0] data;
input [15:0] checksum;
output ok;

wire [15:0] calculated;

inet_chksum C(data, calculated);

assign ok = checksum == calculated;

endmodule
