// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q12

module top_module (
    input  clk,
    input  enable,
    input  S,
    input  A,
    input  B,
    input  C,
    output Z
);
  reg [7:0] Q;
  always @(posedge clk) begin
    if (enable) begin
      Q <= Q << 1;
      Q[0] <= S;
    end
  end

  always_comb begin
    Z = Q[{A, B, C}];
  end
endmodule
