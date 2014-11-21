`timescale 1 ns / 1 ns

module receiver_tb;

reg [47:0] data;
wire ok;

receiver DUT(data, ok);

/* Clock */
reg clk;
always
    #10 clk = ~clk;

always @(posedge clk)
    $display("%t:\tdata\t%h\n\tok\t%b\n", $time, data, ok);

initial
begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;
    data = 0;

    @(negedge clk)
    data = 48'b100111010010110111000011110101011001111011111100;

    @(negedge clk)
    data = 48'b100111010010110111000011110101011001111011111101;

    @(negedge clk)
    data = 48'b100111010010110111100111110101011001111011111100;

    @(negedge clk)
    data = 48'b100111010010110111000011110101011001111011111100;

    @(negedge clk)
    data = 0;

    $finish;
end
endmodule
