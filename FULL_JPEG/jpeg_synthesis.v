module top_jpeg_synthesis(
    input clk,
    input reset, 
    input [8*8-1:0] data_in,
    output reg [8*8-1:0] data_out,
    output reg [15-1:0] address_in,
    output reg [15-1:0] address_out
);
    //synthesis
    reg [8*12-1:0] dequant_out_q;
    reg [8*8-1:0] data_in_q;
    wire [8*8-1:0] data_out_d;
    wire [15-1:0] address_out_d;
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
    Full_dct DCT(.clk(clk), .reset(reset), .data_in(data_in_q), .cnt_in(address_in), .data_out(dct_2d_out)); // first data out at cnt 19
    // quantization
    wire [8*8-1:0] Quant_out;
    Quantization Quant(.clk(clk), .reset(reset), .data_in(dct_2d_out), .data_out(Quant_out), .cnt_in(address_in));  // first data out at cnt 19
    // zigzag a
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
    // add dff
    always @(posedge clk) begin
        if (!reset) begin
            dequant_out_q <= 96'b0;
        end else begin
            dequant_out_q <= Dequant_out;
        end
    end
    // Inverse DCT
    Full_idct IDCT(.clk(clk), .reset(reset), .data_in(dequant_out_q), .data_out(data_out_d), .cnt_in(address_in), .cnt_out(address_out_d));    
    // synthesis
    always @ (posedge clk) begin
        if (!reset) begin
            data_in_q <= 64'b0;
            data_out <= 64'b0;
        end else begin
            data_in_q <= data_in;
            data_out <= data_out_d;
            address_out <= address_out_d;
        end
    end
endmodule
