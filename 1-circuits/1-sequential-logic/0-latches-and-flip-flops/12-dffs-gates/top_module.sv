module top_module(
  input clk,
  input x,
  output z
);
  reg reg_xor;
  reg reg_and;
  reg reg_or;
  always @(posedge clk) begin
    reg_xor <= x ^ reg_xor;
    reg_and <= x & ~reg_and;
    reg_or  <= x | ~reg_or;
  end

  assign z = ~(reg_xor | reg_and | reg_or);
endmodule
