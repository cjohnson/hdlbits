module top_module(
  input [31:0] a,
  input [31:0] b,
  output [31:0] sum
);
  wire low_cout;
  add16 low_add(a[15:0], b[15:0], 0, sum[15:0], low_cout);

  wire [16:0] high_sum_cin0, high_sum_cin1;
  add16 high_add_cin0(a[31:16], b[31:16], 0, high_sum_cin0, 0);
  add16 high_add_cin1(a[31:16], b[31:16], 1, high_sum_cin1, 0);

  assign sum[31:16] = low_cout ? high_sum_cin1 : high_sum_cin0;
endmodule
