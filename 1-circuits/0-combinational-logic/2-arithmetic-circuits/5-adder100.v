module FA(
  input a,
  input b,
  input cin,
  output cout,
  output sum
);
  assign sum  = a ^ (b ^ cin);
  assign cout = a & b | a & cin | b & cin;
endmodule

module top_module(
  input [99:0] a,
  input [99:0] b,
  input cin,
  output [99:0] sum,
  output cout
);
  wire [99:0] cout_internal;
  genvar i;
  generate
    for (i = 0; i < 100; ++i) begin: genFAs
      wire fa_cin = (i == 0) ? cin : cout_internal[i-1];
      FA fa(a[i], b[i], fa_cin, cout_internal[i], sum[i]);
    end
  endgenerate

  assign cout = cout_internal[99];
endmodule
