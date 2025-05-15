module top_controller(
    input clk, nrst, start,
    output done
);
    wire [10-1:0] address_A, address_C;
    wire [8-1:0] address_B;
    wire [8-1:0] A_out;
    wire [32-1:0] B_out;
    wire [21-1:0] C_in;
    wire NCE, NWRT, NCE_out, NWRT_out;
    mm_controller ctrl(.clk(clk), .nrst(nrst), .start(start), .A_out(A_out), .B_out(B_out), .C_in(C_in), .address_a(address_A), .address_c(address_C),
                        .address_b(address_B), .nce(NCE), .nwrt(NWRT), .nce_out(NCE_out), .nwrt_out(NWRT_out), .done(done));
    rflp1024x8mx2 MEM_A(.DO(A_out), .DIN(8'b0), .RA(address_A[9:2]), .CA(address_A[1:0]), .NWRT(NWRT), .NCE(NCE), .CLK(clk));
    rflp256x32mx2 MEM_B(.DO(B_out), .DIN(32'b0), .RA(address_B[7:2]), .CA(address_B[1:0]), .NWRT(NWRT), .NCE(NCE), .CLK(clk));
    rflp1024x21mx2 MEM_C(.DO(), .DIN(C_in), .RA(address_C[9:2]), .CA(address_C[1:0]), .NWRT(NWRT_out), .NCE(NCE_out), .CLK(clk)); 
endmodule