module top_jpeg(
    input clk,
    input reset, 
    input [8*8-1:0] data_in,
    output [8*8-1:0] data_out,
    output reg [15-1:0] address_in,
    output [15-1:0] address_out
);
    // counter for all 
    always @(posedge clk) begin
        if (!reset) begin
            address_in <= 15'b0000_0000_0000_000;
        end else begin
            address_in <= address_in + 1;
        end
    end
    
    // 2D DCT
    wire [8*12-1:0] dct_2d_out;
    Full_dct DCT(.clk(clk), .reset(reset), .data_in(data_in), .cnt_in(address_in), .data_out(dct_2d_out)); // first data out at cnt 19
    // quantization
    wire [8*8-1:0] Quant_out;
    Quantization Quant(.clk(clk), .reset(reset), .data_in(dct_2d_out), .data_out(Quant_out), .cnt_in(address_in));  // first data out at cnt 19
    // zigzag 
    wire [8*64-1:0] Zigzag_out;
    zigzag Zigzag(.data_in(Quant_out), .data_out(Zigzag_out), .cnt_in(address_in)); // first data out at cnt 26
    // encoding
    wire [14*64-1:0] encoded_out;
    RLE RLE(.data_in(Zigzag_out), .encoded_data(encoded_out)); // first data out at cnt 26
    // decoding
    wire [8*64-1:0] decoded_out;
    decoder_full Decoder(.data_in(encoded_out), .data_out(decoded_out));    // first data out at cnt 26 
    // inverse zigzag
    wire [8*8-1:0] inverse_zigzag_out;
    inverse_zigzag Inverse_Zigzag(.data_in(decoded_out), .data_out(inverse_zigzag_out), .address_in(address_in));   // first data out at cnt 26, first block done at 33
    // Dequantization
    wire [8*12-1:0] Dequant_out;
    Dequantization Dequant(.data_in(inverse_zigzag_out), .data_out(Dequant_out), .cnt_in(address_in)); // first data out at 26
    // Inverse DCT
    Full_idct IDCT(.clk(clk), .reset(reset), .data_in(Dequant_out), .data_out(data_out), .cnt_in(address_in), .cnt_out(address_out));    
endmodule