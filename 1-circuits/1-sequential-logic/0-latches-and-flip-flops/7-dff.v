module top_module(
  input clk,
  input d,
  input ar,
  output q
);
  always @(posedge clk, posedge ar) begin
    if (ar) begin
      q <= 1'd0;
    end
    else begin
      q <= d;
    end
  end
endmodule
