module mux_2to1_4b
(
    output reg  [3:0]out,
    input       [3:0]i0, i1,
    input       sel
);

always @*
begin
  if(sel==0)   out <= i0;
  else         out <= i1;
end

endmodule

module mux_2to1_1b
(
    output reg  out,
    input       i0, i1,
    input       sel
);

always @*
begin
  if(sel==0)   out <= i0;
  else         out <= i1;
end

endmodule