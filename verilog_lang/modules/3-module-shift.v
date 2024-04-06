module top_module(
  input clk,
  input d,
  output q
);
  wire dff_out_1, dff_out_2;
  my_dff dff_1(clk, d, dff_out_1);
  my_dff dff_2(clk, dff_out_1, dff_out_2);
  my_dff dff_3(clk, dff_out_2, q);
endmodule
