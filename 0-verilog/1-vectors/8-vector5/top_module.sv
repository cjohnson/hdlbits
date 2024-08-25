// https://hdlbits.01xz.net/wiki/Vector5

module top_module (
    input a,
    input b,
    input c,
    input d,
    input e,
    output [24:0] out
);
  assign out = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}} ~^ {5{a, b, c, d, e}};
endmodule
