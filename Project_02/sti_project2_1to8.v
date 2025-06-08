module sti_project2_1to8;

    reg clk;
    reg reset;


    integer f;
    integer i;
    integer file_idx;
    reg [8*20:1] file_in_name;
    reg [8*20:1] file_out_name;

    initial begin
        clk <= 1;
        forever #5 clk <= ~clk;
    end

    top_memory_test TEST (
        .clk(clk),
        .reset(reset)
    );

    initial begin
        for (file_idx = 1; file_idx <= 8; file_idx = file_idx + 1) begin

            reset <= 0;
            #12;
            reset <= 1;
            #1;

            $sformat(file_in_name, "image_in_%0d.txt", file_idx);
            $display(">> Loading input file: %s", file_in_name);
            $readmemh(file_in_name, TEST.MEM_IN.SRAM_syn.SRAM32768x64.Mem);

            #327900;

            $sformat(file_out_name, "DCT_image_%0d.txt", file_idx);
            $display(">> Writing output file: %s", file_out_name);

            f = $fopen(file_out_name, "w");
            for (i = 0; i < 32768; i = i + 1) begin

                $fwrite(f, "%b\n", TEST.MEM_OUT.SRAM_syn2.SRAM32768x96.Mem[i]);
            end
            $fclose(f);

            #100;
        end

        $display(">> All 8 images processed. Simulation finished.");
        $finish;
    end

endmodule