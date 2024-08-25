// https://hdlbits.01xz.net/wiki/Module_addsub

module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
  wire low_cout;
  add16 low_add (
      .a(a[15:0]),
      .b(b[15:0] ^ {16{sub}}),
      .cin(sub),
      .sum(sum[15:0]),
      .cout(low_cout)
  );
  add16 high_add (
      .a(a[31:16]),
      .b(b[31:16] ^ {16{sub}}),
      .cin(low_cout),
      .sum(sum[31:16]),
      .cout(0)
  );
endmodule
