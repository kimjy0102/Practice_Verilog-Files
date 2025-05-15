module top_FIR_filter(
    input  clk, reset
);
    reg nce, nwrt, reset2;
    reg enable;
    reg nce_out, nwrt_out;
    wire [8-1:0] count_out, count2_out;
    wire signed [16-1:0] direct, trans;
    wire signed [26-1:0] direct_out, trans_out;
    always @ (posedge clk) begin
        if (!reset) begin
            nce <= 1'b1;
            nwrt <= 1'b0;
            reset2 <= 1'b0;
            enable <= 1'b0;
            nce_out <= 1'b1;
            nwrt_out <= 1'b1;
        end
        else begin
           nce <= 1'b0;
           nwrt <= 1'b1; 
           reset2 <= 1'b1;
        end
        if (count_out == 8'b0000_0111) begin
            enable <= 1'b1;
            nce_out <= 1'b0;
            nwrt_out <= 1'b0;
        end
    end
    counter_8bit count2(.clk(clk), .rstn(enable), .out(count2_out));
    counter_8bit count(.clk(clk), .rstn(reset2), .out(count_out));
    rflp256x16mx2 DIRECT_INPUT_MEM(.NWRT(nwrt), .NCE(nce), .CLK(clk), .DIN(), .RA(count_out[7:2]), .CA(count_out[1:0]), .DO(direct));
    rflp256x16mx2 TRANS_INPUT_MEM(.NWRT(nwrt), .NCE(nce), .CLK(clk), .DIN(), .RA(count_out[7:2]), .CA(count_out[1:0]), .DO(trans));
    lowcost_direct_fir_filter M0(.a(direct), .clk(clk), .reset(reset2), .b(direct_out));
    lowcost_trans_fir_filter M1(.a(trans), .clk(clk), .reset(reset2), .b(trans_out));
    rflp256x26mx2 DIRECT_OUTPUT_MEM(.NWRT(nwrt_out), .NCE(nce_out), .CLK(clk), .DIN(direct_out), .DO(), .RA(count2_out[7:2]), .CA(count2_out[1:0]));
    rflp256x26mx2 TRANS_OUTPUT_MEM(.NWRT(nwrt_out), .NCE(nce_out), .CLK(clk), .DIN(trans_out), .DO(), .RA(count2_out[7:2]), .CA(count2_out[1:0]));
endmodule