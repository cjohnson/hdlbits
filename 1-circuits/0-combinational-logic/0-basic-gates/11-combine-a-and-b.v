module A(
  input x,
  input y,
  output z
);
  assign z = (x ^ y) & x;
endmodule

module B(
  input x,
  input y,
  output z
);
  assign z = x ~^ y;
endmodule

module top_module(
  input x,
  input y,
  output z
);
  wire IA1_z;
  A IA1(x, y, IA1_z);

  wire IB1_z;
  B IB1(x, y, IB1_z);

  wire IA2_z;
  A IA2(x, y, IA2_z);

  wire IB2_z;
  B IB2(x, y, IB2_z);

  assign z = (IA1_z | IB1_z) ^ (IA2_z & IB2_z);
endmodule
