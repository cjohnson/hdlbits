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
  input [3:0] x,
  input [3:0] y,
  output [4:0] sum
);
  wire [3:0] cout;
  genvar i;
  generate
    for (i = 0; i < 4; ++i) begin: genFAs
      wire fa_cin = (i == 0) ? 1'b0 : cout[i-1];
      FA fa(x[i], y[i], fa_cin, cout[i], sum[i]);
    end
  endgenerate

  assign sum[4] = cout[3];
endmodule
