`timescale 1 ns / 1 ns

module receiver_tb;

reg [31:0] data;
reg [15:0] checksum;
wire ok;

receiver DUT(data, checksum, ok);

/* Clock */
reg clk;
always
    #10 clk = ~clk;

always @(posedge clk)
    $display("%t:\tdata\t\t%b\n\tchecksum\t%b\n\tok\t\t%b\n", $time, data, checksum, ok);

initial
begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    data = 0;
    checksum = 0;

    @(negedge clk)
    data =  32'b10011101001011011100001111010101;
    checksum = 16'b1001111011111100;

    @(negedge clk)
    checksum = 16'b1001111011111101; // 1 bit off

    @(negedge clk)
    data = 0;
    checksum = 0;

    $finish;
end
endmodule
