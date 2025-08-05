module top_jpeg_test(
    input clk,
    input reset
);
    wire [8*8-1:0] data_in;
    wire [8*8-1:0] data_out;
    wire [15-1:0] address_in, address_out;
    top_jpeg JPEG(.clk(clk), .reset(reset), .data_in(data_in), .data_out(data_out), .address_in(address_in), .address_out(address_out));
    SRAM32768x64 MEM_IN(.NWRT(1'b1), .DIN(), .RA(address_in[14:4]), .CA(address_in[3:0]), .NCE(1'b0), .CK(clk), .DO(data_in));
    SRAM32768x64 MEM_OUT(.NWRT(1'b0), .DIN(data_out), .RA(address_out[14:4]), .CA(address_out[3:0]), .NCE(1'b0), .CK(clk), .DO());
endmodule
