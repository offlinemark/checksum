`timescale 1 ns / 1 ns

module inet_chksum_tb;

reg [31:0] data;
wire [15:0] checksum;

inet_chksum DUT(data, checksum);

/* Clock */
reg clk;
always
    #10 clk = ~clk;

always @(posedge clk)
    $display("%t:\tdata\t\t%b\n\tchecksum\t%b\n", $time, data, checksum);

initial
begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    data = 0;

    @(negedge clk)
    data =  32'b10011101001011011100001111010101;

    @(negedge clk)
    data = 0;

    $finish;
end
endmodule
