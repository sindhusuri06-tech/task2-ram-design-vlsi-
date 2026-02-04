module RAM (
    input clk,
    input we,              // Write Enable
    input [3:0] addr,      // Address (16 locations)
    input [7:0] data_in,   // Data input
    output reg [7:0] data_out  // Data output
);

reg [7:0] memory [15:0];   // 16 x 8 RAM

always @(posedge clk) begin

    if (we) begin
        memory[addr] <= data_in;   // Write
    end

    data_out <= memory[addr];     // Read

end

endmodule
