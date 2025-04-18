module DFF_28bit
    (
        output reg  [27:0]  q,
        input       [27:0]  d,
        input               clk, rstn
    );

    always@(posedge clk)
    begin
        if(!rstn)   q <= 28'b0;
        else        q <= d;
    end
endmodule

module DFF_56bit
    (
        output reg  [55:0]  q,
        input       [55:0]  d,
        input               clk, rstn
    );

    always@(posedge clk)
    begin
        if(!rstn)   q <= 56'b0;
        else        q <= d;
    end
endmodule

