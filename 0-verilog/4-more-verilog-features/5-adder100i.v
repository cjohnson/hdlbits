module top_module(
  input [99:0] a, b,
  input cin,
  output [99:0] cout,
  output [99:0] sum
);
  genvar i;
  generate
    for (i = 0; i < 100; ++i) begin: genFAs
      wire cin_local = i == 0 ? cin : cout[i - 1];
      FA fa0(a[i], b[i], cin_local, sum[i], cout[i]);
    end
  endgenerate
endmodule

module FA(
  input a, b, cin,
  output s, cout
);
  assign s = a ^ (b ^ cin);
  assign cout = a & b | a & cin | b & cin;
endmodule
