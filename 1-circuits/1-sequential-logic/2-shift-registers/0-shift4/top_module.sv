// https://hdlbits.01xz.net/wiki/Shift4

module top_module (
    input clk,
    input areset,
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q
);
  always @(posedge clk, posedge areset) begin
    if (areset) begin
      q <= 4'd0;
    end else if (load) begin
      q <= data;
    end else if (ena) begin
      q <= q >> 1;
    end
  end
endmodule
