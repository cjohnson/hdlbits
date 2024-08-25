module top_module(
  input [31:0] a,
  input [31:0] b,
  input sub,
  output [31:0] sum
);
  wire low_cout;
  add16 low_add ( a[15:0], b[15:0]  ^ { 16{sub} },      sub,  sum[15:0], low_cout);
  add16 high_add(a[31:16], b[31:16] ^ { 16{sub} }, low_cout, sum[31:16],        0);
endmodule
