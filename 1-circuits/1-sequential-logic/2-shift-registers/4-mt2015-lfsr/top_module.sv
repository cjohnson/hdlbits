// https://hdlbits.01xz.net/wiki/Mt2015_lfsr

module shift_register (
    input clk,
    input l,
    input [2:0] r,
    output [2:0] q
);
  always @(posedge clk) begin
    if (l) q <= r;
    else begin
      q[0] <= q[2];
      q[1] <= q[0];
      q[2] <= (q[1] ^ q[2]);
    end
  end
endmodule

module top_module (
    input  [2:0] SW,   // R
    input  [1:0] KEY,  // L and clk
    output [2:0] LEDR  // Q
);
  shift_register(
      .clk(KEY[0]), .l(KEY[1]), .r(SW[2:0]), .q(LEDR[2:0])
  );
endmodule
