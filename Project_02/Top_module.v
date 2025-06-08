module top_memory_test(
    input clk,
    input reset
);
    // Input memory
    wire nce_in;
    wire [8*8-1:0] data_in;
    // output memory
    wire nce_out;
    wire [8*12-1:0] data_out;
    // address wire
    wire [15-1:0] address_in, address_out;
    assign nce_in = 1'b0;
    assign nce_out = 1'b0;
    // module instantiation
    Full_dct DCT(.clk(clk), .reset(reset), .data_in(data_in), .data_out(data_out), .cnt_in(address_in), .cnt_out(address_out));
    SRAM32768x64 MEM_IN(.NWRT(1'b1), .DIN(), .RA(address_in[14:4]), .CA(address_in[3:0]), .NCE(nce_in), .CK(clk), .DO(data_in));
    SRAM32768x96 MEM_OUT(.NWRT(1'b0), .DIN(data_out), .RA(address_out[14:4]), .CA(address_out[3:0]), .NCE(nce_out), .CK(clk), .DO());
endmodule