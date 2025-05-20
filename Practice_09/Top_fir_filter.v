module Top_FIR_filter(
    input clk100,
    input clk20,
    input reset,
    input signed [13-1:0] c0, c1, c2, c3, c4
);
    wire [8-1:0] address_in;
    wire [8-1:0] address_out;
    wire signed [12-1:0] data_out;
    wire signed [22-1:0] data_in;
    reg  NCE, NCE_OUT, enable, reset2;
    always @ (posedge clk20) begin
        if (!reset) begin
            NCE <= 1'b1;
            NCE_OUT <= 1'b1;
            enable <= 1'b0;
            reset2 <= 1'b0;
        end
        else begin
            reset2 <= 1'b1;
            NCE <= 1'b0;
            if (address_in == 8'b0000_0110) begin
                enable <= 1'b1;
                NCE_OUT <= 1'b0;
            end
        end
    end

    counter_8bit count(.clk(clk20), .rstn(reset2), .out(address_in));
    counter_8bit count2(.clk(clk20), .rstn(enable), .out(address_out));
    rflp256x12mx4 FOLDED_INPUT_MEM(.NWRT(1'b1), .DIN(12'b0), .RA(address_in[7:2]), .CA(address_in[1:0]), .NCE(NCE), .CLK(clk20), .DO(data_out));
    folded_fir_filter folded(.clk100(clk100), .clk20(clk20), .reset(reset), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .a(data_out), .b(data_in));
    rflp256x22mx4 FOLDED_OUTPUT_MEM(.NWRT(1'b0), .DIN(data_in), .RA(address_out[7:2]), .CA(address_out[1:0]), .NCE(NCE_OUT), .CLK(clk20), .DO());

endmodule

module counter_8bit(
    input clk, rstn,
    output reg [8-1:0] out
);
    always @ (posedge clk) begin
        if ( !rstn ) out <= 8'b0;
        else         out <= out + 1;
    end
endmodule
