module RAM_tb;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] data_in;

wire [7:0] data_out;

RAM uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock Generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    we = 0;
    addr = 0;
    data_in = 0;

    // Write Data
    #10 we = 1; addr = 4'b0001; data_in = 8'b10101010;
    #10 addr = 4'b0010; data_in = 8'b11001100;

    // Stop Write
    #10 we = 0;

    // Read Data
    #10 addr = 4'b0001;
    #10 addr = 4'b0010;

    #50 $stop;

end

endmodule
