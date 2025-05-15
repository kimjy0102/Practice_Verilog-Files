module mm_controller_synthesis(
    input clk, nrst, start,
    input [8-1:0] A_out,
    input [32-1:0] B_out,
    output reg [21-1:0] C_in,
    output reg [10-1:0] address_a, address_c,
    output reg [8-1:0] address_b,
    output reg done, nce, nwrt, nce_out, nwrt_out
);
    reg [8-1:0] A_out_q;
    reg [32-1:0] B_out_q;
    wire done_d;
    wire nce_d, nwrt_d, nce_out_d, nwrt_out_d;
    wire [10-1:0] address_a_d, address_c_d;
    wire [8-1:0] address_b_d;
    wire [21-1:0] C_in_d;
    mm_controller ctrl(.clk(clk), .nrst(nrst), .start(start), .A_out(A_out_q), .B_out(B_out_q), .C_in(C_in_d), .address_a(address_a_d), .address_c(address_c_d),
                        .address_b(address_b_d), .nce(nce_d), .nwrt(nwrt_d), .nce_out(nce_out_d), .nwrt_out(nwrt_out_d), .done(done_d));
    always @(posedge clk) begin
        if (!nrst) begin
            A_out_q <= 8'b0000_0000;
            B_out_q <= 32'b0000_0000_0000_0000_0000_0000_0000_0000;
            
            done <= 1'b0;
            nce <= 1'b0;
            nwrt <= 1'b0;
            nce_out <= 1'b0;
            nwrt_out <= 1'b0;
            address_a <= 10'b0000_0000_00;
            address_b <= 8'b0000_0000;
            address_c <= 10'b0000_0000_00;
            C_in <= 21'b0000_0000_0000_0000_0000_0;
        end
        else begin
            A_out_q <= A_out;
            B_out_q <= B_out;

            done <= done_d;
            nce <= nce_d;
            nwrt <= nwrt_d;
            nce_out <= nce_out_d;
            nwrt_out <= nwrt_out_d;
            address_a <= address_a_d;
            address_b <= address_b_d;
            address_c <= address_c_d;
            C_in <= C_in_d;
        end
    end
endmodule
