module Full_idct(
    input clk,
    input reset,
    input [8*12-1:0] data_in,
    output [8*8-1:0] data_out,
    input [15-1:0] cnt_in,
    output reg [15-1:0] cnt_out
);
    // address of sram and counter;
    reg TP1_enable;
    reg TP2_enable;
    reg TP1_reset, TP2_reset;
    wire [8*11-1:0] DCT_1D_out;
    wire enable_0, enable_2;
    reg out_enable;
    wire [8*8-1:0] DCT_2D_out;
    // output of first tpmem is 8*8 bits
    wire [8*11-1:0] TP_0_out;

    // output of second tpmem is 8*12 bits
    wire [8*8-1:0] TP_2_out;
    always @(posedge clk) begin
        if (!reset) begin
            TP1_enable <= 1'b0;
            TP2_enable <= 1'b0;
            out_enable <= 1'b0;
            TP1_reset <= 1'b0;
            TP2_reset <= 1'b0;
        end
        else begin
            if (cnt_in == 15'b000_0000_0010_1100) begin
                out_enable <= 1'b1;
            end
            if (cnt_in == 15'b000_0000_0001_1010) begin
                TP1_enable <= 1'b1;
                TP1_reset <= 1'b1;
            end 
            else if (cnt_in == 15'b000_0000_00010_0011) begin
                TP2_enable <= 1'b1;
                TP2_reset <= 1'b1;
            end
            else begin
                TP1_enable <= TP1_enable;
                TP2_enable <= TP2_enable;
            end
        end
    end
    // 1d dct output
    // After the first DCT output is 8*8 bits
    IDCT_1D IDCT1(.data_in(data_in), .data_out(DCT_1D_out));

    TPmem_11bit TP3(.i_data(DCT_1D_out), .i_enable(TP1_enable), .i_clk(clk), .i_Reset(TP1_reset), .o_data(TP_0_out), .o_en(enable_0));

    IDCT_2D IDCT2(.data_in(TP_0_out), .data_out(DCT_2D_out));
    // storage enable when counter == 10
    TPmem_8bit TP4(.i_data(DCT_2D_out), .i_enable(TP2_enable), .i_clk(clk), .i_Reset(TP2_reset), .o_data(TP_2_out), .o_en(enable_2));
    // address for output memory
    always @(posedge clk) begin
        if (!out_enable) begin
            cnt_out <= 15'b000_0000_0000_0000;
        end else begin
            cnt_out <= cnt_out + 1;
        end
    end
    assign data_out = TP_2_out;
endmodule
    
