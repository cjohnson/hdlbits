// https://hdlbits.01xz.net/wiki/Rotate100

module top_module (
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q
);
  always @(posedge clk) begin
    if (load) q <= data;
    else if (ena == 2'b00 || ena == 2'b11) q <= q;
    else if (ena == 2'b10) begin
      q <= (q << 1);
      q[0] <= q[99];
    end else if (ena == 2'b01) begin
      q <= (q >> 1);
      q[99] <= q[0];
    end
  end
endmodule
