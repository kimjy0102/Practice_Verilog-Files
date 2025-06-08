module sti_project2;


reg clk;
reg reset;

initial
begin
	clk <= 1;
	reset <= 0;
	#12
	reset <= 1;
end

always #5 clk <= ~clk;

top_memory_test TEST(clk,reset); // define input & output ports of your top module by youself 

initial	$readmemh("image_in_1.txt", TEST.MEM_IN.SRAM_syn.SRAM32768x64.Mem); //input image, check the path of memory rocation (module instance)

integer f;
integer i;
initial
begin
	f = $fopen("DCT_image_1.txt","w"); //output image, this is the output file that finished 2D-DCT operations.

	#327900; //change if you need

	for (i = 0; i<32768; i=i+1)
	begin
		$display("DATA %b", TEST.MEM_OUT.SRAM_syn2.SRAM32768x96.Mem[i]); //check the path of memory rocation (module instance)
		$fwrite(f,"%b\n",   TEST.MEM_OUT.SRAM_syn2.SRAM32768x96.Mem[i]); //check the path of memory rocation (module instance)
	end
   
	#100
	$fclose(f);  
	$finish;
end


endmodule
