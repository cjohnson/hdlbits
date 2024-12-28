// https://hdlbits.01xz.net/wiki/Exams/2014_q4b

module top_module (
    input  [3:0] SW,
    input  [3:0] KEY,
    output [3:0] LEDR
);
  MUXDFF m3 (
      .clk(KEY[0]),
      .E  (KEY[1]),
      .R  (SW[3]),
      .L  (KEY[2]),
      .in (KEY[3]),
      .out(LEDR[3]),
  );
  MUXDFF m2 (
      .clk(KEY[0]),
      .E  (KEY[1]),
      .R  (SW[2]),
      .L  (KEY[2]),
      .in (LEDR[3]),
      .out(LEDR[2]),
  );
  MUXDFF m1 (
      .clk(KEY[0]),
      .E  (KEY[1]),
      .R  (SW[1]),
      .L  (KEY[2]),
      .in (LEDR[2]),
      .out(LEDR[1]),
  );
  MUXDFF m0 (
      .clk(KEY[0]),
      .E  (KEY[1]),
      .R  (SW[0]),
      .L  (KEY[2]),
      .in (LEDR[1]),
      .out(LEDR[0]),
  );
endmodule

module MUXDFF (
    input clk,
    input E,
    input R,
    input L,
    input in,
    output reg out
);
  always @(posedge clk) begin
    if (L) out <= R;
    else if (E) out <= in;
    else out <= out;
  end
endmodule
