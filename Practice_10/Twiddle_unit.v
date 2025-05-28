module Twiddle_Factor(
    output [24-1:0] out,
    input [24-1:0] C, T
);
    wire signed [12-1:0] Cr, Ci, Tr, Ti;
    assign Cr = C[23:12];
    assign Ci = C[11:0];
    assign Tr = T[23:12];
    assign Ti = T[11:0];
    wire signed [25-1:0] O_r, O_i;
    assign O_r = Cr * Tr - Ci * Ti; // Real part
    assign O_i = Cr * Ti + Ci * Tr; // Imaginary part
    assign out[23:12] = O_r[21:10];
    assign out[11:0] = O_i[21:10];
endmodule