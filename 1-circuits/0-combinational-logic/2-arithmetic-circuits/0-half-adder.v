module top_module(
  input a,
  input b,
  output cout,
  output sum
);
  assign sum  = a ^ b;
  assign cout = a & b;
endmodule
