module Butterfly_unit_synthesis(
    output reg [24-1:0] C1, C2,
    input [24-1:0] A, B,
    input clk, reset
);
    reg [24-1:0] A_q, B_q;
    wire [24-1:0] C1_d, C2_d;
    assign C1_d[23:12] = ({A_q[23], A_q[23:12]} + {B_q[23], B_q[23:12]}) >> 1;
    assign C1_d[11:0] = ({A_q[11], A_q[11:0]} + {B_q[11], B_q[11:0]}) >> 1;
    assign C2_d[23:12] = ({A_q[23], A_q[23:12]} - {B_q[23], B_q[23:12]}) >> 1;
    assign C2_d[11:0] = ({A_q[11], A_q[11:0]} - {B_q[11], B_q[11:0]}) >> 1;
    always @ (posedge clk) begin
        if (!reset) begin
            C1 <= 24'b0;
            C2 <= 24'b0;
            A_q <= 24'b0;
            B_q <= 24'b0;
        end else begin
            A_q <= A;
            B_q <= B;
            C1 <= C1_d;
            C2 <= C2_d;
        end
    end

endmodule
