module top_module(
  input clk,
  input reset,
  input [31:0] in,
  output [31:0] out
);
  reg [31:0] last_in;
  always @(posedge clk) begin
    last_in <= in;
    if (reset) begin
      out <= 32'd0;
    end
    else begin
      out <= (out) | (last_in & ~in);
    end
  end
endmodule
