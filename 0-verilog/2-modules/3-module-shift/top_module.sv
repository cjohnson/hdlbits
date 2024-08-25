// https://hdlbits.01xz.net/wiki/Module_shift

module top_module (
    input  clk,
    input  d,
    output q
);
  wire dff_out_1, dff_out_2;
  my_dff dff_1 (
      .clk(clk),
      .d  (d),
      .q  (dff_out_1)
  );
  my_dff dff_2 (
      .clk(clk),
      .d  (dff_out_1),
      .q  (dff_out_2)
  );
  my_dff dff_3 (
      .clk(clk),
      .d  (dff_out_2),
      .q  (q)
  );
endmodule
