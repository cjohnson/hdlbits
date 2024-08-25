module top_module(
  input clk,
  input [7:0] d,
  input [1:0] sel,
  output [7:0] q
);
  wire [7:0] dff1_out, dff2_out, dff3_out;
  my_dff8 dff1(clk,        d, dff1_out);
  my_dff8 dff2(clk, dff1_out, dff2_out);
  my_dff8 dff3(clk, dff2_out, dff3_out);

  always @(*) begin
    case (sel)
      2'b00: q = d;
      2'b01: q = dff1_out;
      2'b10: q = dff2_out;
      2'b11: q = dff3_out;
    endcase
  end
endmodule
