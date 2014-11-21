`timescale 1 ns / 1 ns

module receiver(data, ok);

/* Args */
input [47:0] data;
output ok;

wire [15:0] given_checksum;
wire [15:0] calc_sum;

ones_comp_sum S(data[47:32], data[31:16], calc_sum);
assign ok = (data[15:0] + calc_sum) == 16'hffff;

endmodule
