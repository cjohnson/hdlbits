// https://hdlbits.01xz.net/wiki/Lfsr5

module top_module (
    input clk,
    input reset,  // Active-high synchronous reset to 5'h1
    output [4:0] q
);
  always @(posedge clk) begin
    if (reset) q <= 5'h1;
    else begin
      q[0] <= q[1];
      q[1] <= q[2];
      q[2] <= (q[3] ^ q[0]);
      q[3] <= q[4];
      q[4] <= (0 ^ q[0]);
    end
  end
endmodule
