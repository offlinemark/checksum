`timescale 1 ns / 1 ns

module sender_tb;

reg [31:0] data;
wire [47:0] out;

sender DUT(data, out);

/* Clock */
reg clk;
always
    #10 clk = ~clk;

always @(posedge clk)
    $display("%t:\tdata\t%b\n\tout\t%b\n", $time, data, out);

initial
begin
    $timeformat(-9, 0, " ns", 2);
    clk = 0;

    @(negedge clk)
    data =  32'b10011101001011011100001111010101;

    @(negedge clk)
    data = 0;

    $finish;
end
endmodule
