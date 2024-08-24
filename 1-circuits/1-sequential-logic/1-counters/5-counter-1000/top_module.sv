// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7b

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);
  assign c_enable[0] = 1'b1;
  assign c_enable[1] = q0 == 4'd9;
  assign c_enable[2] = q1 == 4'd9 && c_enable[1];

  wire [3:0] q0, q1, q2;
  bcdcount c0 (
      .clk(clk),
      .reset(reset),
      .enable(c_enable[0]),
      .Q(q0)
  );
  bcdcount c1 (
      .clk(clk),
      .reset(reset),
      .enable(c_enable[1]),
      .Q(q1)
  );
  bcdcount c2 (
      .clk(clk),
      .reset(reset),
      .enable(c_enable[2]),
      .Q(q2)
  );

  assign OneHertz = (q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9);
endmodule
