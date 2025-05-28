module Twiddle_Factor_synthesis(
    output reg [24-1:0] out,
    input [24-1:0] C, T,
    input clk, reset
);
    wire signed [12-1:0] Cr, Ci, Tr, Ti;
    reg [24-1:0] C_q, T_q;
    wire [24-1:0] out_d;
    assign Cr = C_q[23:12];
    assign Ci = C_q[11:0];
    assign Tr = T_q[23:12];
    assign Ti = T_q[11:0];
    wire signed [25-1:0] O_r, O_i;
    assign O_r = Cr * Tr - Ci * Ti; // Real part
    assign O_i = Cr * Ti + Ci * Tr; // Imaginary part
    assign out_d[23:12] = O_r[21:10];
    assign out_d[11:0] = O_i[21:10];
    always @ (posedge clk ) begin
        if (!reset) begin
            out <= 24'b0;
            C_q <= 24'b0;
            T_q <= 24'b0;
        end else begin
            C_q <= C;
            T_q <= T;
            out <= out_d;
        end 
    end

endmodule
