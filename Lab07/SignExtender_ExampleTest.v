`timescale 1ns / 1ps

`define STRLEN 32
module ALUTest_v;

	task passTest;
		input [64:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %x should be %x", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask

	// Inputs
	reg [25:0]  Imm16; 
	reg [1:0]	 Ctrl; 
	reg [7:0] passed;
	
	 

	// Outputs
	wire [63:0] BusImm;
	
	// Instantiate the Unit Under Test (UUT)
	SignExtender_Example uut(
		.BusImm(BusImm),
		.Imm16(Imm16),
		.Ctrl(Ctrl)
	);

	initial begin
		// Initialize Inputs
		Imm16 = 0;
		Ctrl = 0;
		passed = 0;

        // Here is one example test vector, testing the ADD instruction:
		{Imm16, Ctrl} = {26'h100000, 2'b00}; #40; passTest({BusImm}, 64'h400, "I+", passed);
		{Imm16, Ctrl} = {26'h3ffff38, 2'b00}; #40; passTest({BusImm}, 64'hffffffffffffffff, "I-", passed);
		
		{Imm16, Ctrl} = {26'h100000, 2'b01}; #40; passTest({BusImm}, 64'h100, "D+", passed);
		{Imm16, Ctrl} = {26'h3ffff38, 2'b01}; #40; passTest({BusImm}, 64'hffffffffffffffff, "D-", passed);
		
		{Imm16, Ctrl} = {26'h100000, 2'b10}; #40; passTest({BusImm}, 64'h400000, "B+", passed);
		{Imm16, Ctrl} = {26'h3ffff38, 2'b10}; #40; passTest({BusImm}, 64'hfffffffffffffce0, "B-", passed);
		
		{Imm16, Ctrl} = {26'h100000, 2'b11}; #40; passTest({BusImm}, 64'h20000, "C+", passed);
		{Imm16, Ctrl} = {26'h3ffff38, 2'b11}; #40; passTest({BusImm}, 64'hffffffffffffffe4, "C-", passed);
		
		//Reformate and add your test vectors from the prelab here following the example of the testvector above.	


		allPassed(passed, 8); // 8 tests were given, so 16 must pass
	end
      
endmodule

