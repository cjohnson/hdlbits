// https://hdlbits.01xz.net/wiki/Module_fadd

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
  add16 high_add (
      .a(a[31:16]),
      .b(b[31:16]),
      .cin(low_cout),
      .sum(sum[31:16]),
      .cout(0)
  );
endmodule

module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
  assign cout = (a & b) | (a & cin) | (b & cin);
  assign sum  = a ^ (b ^ cin);
endmodule
