module top_module(
  input c,
  input d,
  output [3:0] mux_in
);
  // Multiplexers implemented as Verilog ternary operators
  assign mux_in = {
    c ? d : 1'b0,
    d ? 1'b0 : 1'b1,
    d ? 1'b0 : 1'b0,
    c ? 1'b1 : d
  };
endmodule
