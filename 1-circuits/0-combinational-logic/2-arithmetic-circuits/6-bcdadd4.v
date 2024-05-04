module top_module(
  input [15:0] a,
  input [15:0] b,
  input cin,
  output cout,
  output [15:0] sum
);
  wire [3:0] carry;
  genvar i;
  generate
    for (i = 0; i < 4; ++i) begin: genBCDs
      wire bcda_cin = (i == 0) ? cin : carry[i-1];
      bcd_fadd bcda(a[4*i +: 4], b[4*i +: 4], bcda_cin, carry[i], sum[4*i +: 4]);
    end
  endgenerate
  assign cout = carry[3];
endmodule
