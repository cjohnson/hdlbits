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
  input [2:0] a,
  input [2:0] b,
  input cin,
  output [2:0] cout,
  output [2:0] sum
);
  genvar i;
  generate
    for (i = 0; i < 3; ++i) begin: genFAs
      wire fa_cin = (i == 0) ? cin : cout[i-1];
      FA fa(a[i], b[i], fa_cin, cout[i], sum[i]);
    end
  endgenerate
endmodule
