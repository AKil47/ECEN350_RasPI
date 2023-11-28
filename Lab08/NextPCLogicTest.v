`timescale 1ns / 1ps

`define STRLEN 32
module ALUTest_v;

	initial begin
		$dumpfile("NextPCLogic.vcd");
		$dumpvars(0, ALUTest_v);
	end

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
   reg [63:0] CurrentPC, SignExtImm64; 
   reg 	Branch, ALUZero, Uncondbranch; 
   reg [7:0] passed;
	 

	// Outputs
	wire [63:0] NextPC;
	
	// Instantiate the Unit Under Test (UUT)
	NextPClogic uut(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 

	initial begin
		// Initialize Inputs
		CurrentPC = 0;
		SignExtImm64 = 0;
		Branch = 0;
		ALUZero = 0;
		Uncondbranch = 0;
		passed = 0;

        // Here is one example test vector, testing the ADD instruction:
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'h0, 64'h4, 1'b1, 1'b0, 1'b0}; #40; passTest({NextPC}, 64'h4, "CBZ & ALU isn't 0 | positive jump", passed);
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'h0, 64'h4, 1'b1, 1'b1, 1'b0}; #40; passTest({NextPC}, 64'h10, "CBZ & ALU is 0 | positive jump", passed);
		
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'h0, 64'hffffffffffffffffc, 1'b1, 1'b0, 1'b0}; #40; passTest({NextPC}, 64'h4, "CBZ & ALU isn't 0 | negative jump", passed);
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'h10, 64'hffffffffffffffffc, 1'b1, 1'b1, 1'b0}; #40; passTest({NextPC}, 64'h0, "CBZ & ALU is 0 | negative jump", passed);
		
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'h0, 64'h4, 1'b0, 1'b0, 1'b1}; #40; passTest({NextPC}, 64'h10, "B | positive jump", passed);
		{CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch} = {64'h10, 64'hffffffffffffffffc, 1'b0, 1'b0, 1'b1}; #40; passTest({NextPC}, 64'h0, "B  negative jump", passed);
		//Reformate and add your test vectors from the prelab here following the example of the testvector above.	


		allPassed(passed, 6); // 8 tests were given, so 16 must pass
	end
      
endmodule

