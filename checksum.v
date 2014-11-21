`timescale 1 ns / 1 ns

module checksum(data, checksum);

input [31:0] data;
output [15:0] checksum;

wire [15:0] ones_sum;

ones_comp_sum S(data[31:16], data[15:0], ones_sum);

assign checksum = ~ones_sum;

endmodule


module ones_comp_sum(a, b, sum);

input [15:0] a, b;
output reg [15:0] sum;

reg [31:0] sum32;

always @(a or b)
begin
    sum32 = a + b;
    if (sum32 & 32'hffff0000) begin  // check for overflow
        sum = sum32;
        sum = sum + 1;
    end else
        sum = sum32;
end

endmodule
