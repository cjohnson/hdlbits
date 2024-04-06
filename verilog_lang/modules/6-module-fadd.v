module top_module(
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);
  wire low_cout;
  add16 low_add(a[15:0], b[15:0], 0, sum[15:0], low_cout);
  add16 high_add(a[31:16], b[31:16], low_cout, sum[31:16], 0);
endmodule

module add1(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  assign cout = (a & b) | (a & cin) | (b & cin);
  assign sum = a ^ (b ^ cin);
endmodule
