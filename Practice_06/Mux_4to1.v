module mux_4to1(
    input [56-1:0]a, b, c, d,
    input [2-1:0] sel,
    output reg [56-1:0] out
);
    always @ (*) begin
        case (sel)
        2'b00 : begin out = a; end
        2'b01 : begin out = b; end
        2'b10 : begin out = c; end
        2'b11 : begin out = d; end
        endcase
    end
endmodule

