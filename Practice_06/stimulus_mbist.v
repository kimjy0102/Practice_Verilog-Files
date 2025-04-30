`timescale 1 ns / 1 ps
module stimulus_mbist;
    reg MBIST_start, clk, rstn;
    wire [56-1:0] Data_out;
    wire MBIST_done;

    initial begin
        clk <= 1;
        rstn <= 0;
	    MBIST_start <= 0;
        #10
        rstn <= 1;
        #20
        MBIST_start <= 1;
        #10
        MBIST_start <= 0;
        #41010 $stop;
    end
    always #5 clk <= ~clk;
    top_mbist memory(.MBIST_start(MBIST_start), .clk(clk), .rstn(rstn), .Data_out(Data_out), .MBIST_done(MBIST_done));
    
endmodule
