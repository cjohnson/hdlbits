// https://hdlbits.01xz.net/wiki/Rule90

module top_module (
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);
  always @(posedge clk) begin
    if (load) q <= data;
    else begin
      for (int i = 1; i < 511; ++i) begin
        q[i] <= (q[i-1] ^ q[i+1]);
      end
      q[0]   <= q[1];
      q[511] <= q[510];
    end
  end
endmodule
