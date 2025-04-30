module top_memory_ctrl(
    output [56-1:0]out,
    input clk, rstn
);
    wire [56-1:0]Mul_out;
    wire [12-1:0] address;
    wire [56-1:0] memory_out;
    reg [56-1:0] memory_in;
    reg [28-1:0] Mul_a, Mul_b;
    wire enable;
    reg nwrt, nce;
    always @ ( * ) begin
       if ( !address[0] && !address[1] == 1'b1 ) begin
            nce <= 1'b0;
            nwrt <= 1'b1;
       end
       else if ( address[0] && !address[1] == 1'b1 ) begin
            nce <= 1'b1;
            nwrt <= 1'b0;
       end
       else if ( !address[0] && address[1] == 1'b1 ) begin
            nce <= 1'b1;
            nwrt <= 1'b0;
       end
       else begin
            nce <= 1'b0;
            nwrt <= 1'b0;
       end 
    end
    always @ (posedge clk) begin
        if (!rstn) begin
            memory_in <= 56'b0;
            Mul_a <= 28'b0;
            Mul_b <= 28'b0;
        end
        else begin
            memory_in <= Mul_out;
            Mul_a <= memory_out[27:0];
            Mul_b <= memory_out[55:28];
        end
    end
    
    mul_28bit M0(.a(Mul_a), .b(Mul_b), .out(Mul_out));
    counter_12bit A0(.clk(clk), .rstn(rstn), .out(address));
    rflp512x56mx3 memory0(.DO(memory_out), .DIN(memory_in), .RA(address[10:5]), .CA(address[4:2]), .NWRT(nwrt), .NCE(nce), .CLK(clk));
    assign enable = address[11];
    assign out = memory_out * enable;
endmodule