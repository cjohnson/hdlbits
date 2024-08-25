// https://hdlbits.01xz.net/wiki/Module_cseladd

module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);
  wire low_cout;
  add16 low_add (
      .a(a[15:0]),
      .b(b[15:0]),
      .cin(0),
      .sum(sum[15:0]),
      .cout(low_cout)
  );

  wire [16:0] high_sum_cin0, high_sum_cin1;
  add16 high_add_cin0 (
      .a(a[31:16]),
      .b(b[31:16]),
      .cin(0),
      .sum(high_sum_cin0),
      .cout(0)
  );
  add16 high_add_cin1 (
      .a(a[31:16]),
      .b(b[31:16]),
      .cin(1),
      .sum(high_sum_cin1),
      .cout(0)
  );

  assign sum[31:16] = low_cout ? high_sum_cin1 : high_sum_cin0;
endmodule
