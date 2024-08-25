module top_module(
  input [399:0] a, b,
  input cin,
  output cout,
  output [399:0] sum
);
  genvar i;
  wire [99:0] cin_internal;
  generate
    for (i = 0; i < 100; ++i) begin: genBCDs
      wire cin_sel = i == 0 ? cin : cin_internal[i - 1];
      bcd_fadd bcd_fadd0(a[i*4+3:i*4], b[i*4+3:i*4], cin_sel, cin_internal[i], sum[i*4+3:i*4]);
    end
  endgenerate
  assign cout = cin_internal[99];
endmodule
