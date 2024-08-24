// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7a

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);
  count4 counter (
      .clk(clk),
      .enable(c_enable),
      .load(c_load),
      .d(c_d),
      .Q(Q)
  );
  assign c_enable = enable;
  assign c_load = enable & (Q == 4'd12) | reset;
  assign c_d = 4'd1;
endmodule
