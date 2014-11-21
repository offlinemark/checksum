`timescale 1 ns / 1 ns

module checksum(data, checksum);

input [31:0] data;
output reg [15:0] checksum;

reg [31:0] word1, word2, sum;

always @(data)
begin
    word1 = {{16{1'b0}}, data[31:16]};
    word2 = {{16{1'b0}}, data[15:0]};
    sum = word1 + word2;
    if (sum & 32'hffff0000) // check for overflow
    begin
        sum = sum & 32'h0000ffff;
        sum = sum + 1;
    end
    checksum = ~sum;
end

endmodule
