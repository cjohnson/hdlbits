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
  input [7:0] a,
  input [7:0] b,
  output [7:0] s,
  output overflow
);
  wire [7:0] cout;
  genvar i;
  generate
    for (i = 0; i < 8; ++i) begin: genFAs
      wire fa_cin = (i == 0) ? 1'b0 : cout[i-1];
      FA fa(a[i], b[i], fa_cin, cout[i], s[i]);
    end
  endgenerate

  assign overflow = cout[7] ^ cout[6];
endmodule
