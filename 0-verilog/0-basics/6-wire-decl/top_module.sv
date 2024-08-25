// https://hdlbits.01xz.net/wiki/Wire_decl

`default_nettype none

module top_module (
    input  a,
    input  b,
    input  c,
    input  d,
    output out,
    output out_n
);
  wire a_and_b = a & b;
  wire c_and_d = c & d;

  assign out   = a_and_b | c_and_d;
  assign out_n = ~out;
endmodule
