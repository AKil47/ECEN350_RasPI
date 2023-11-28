`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:02:47 03/05/2009
// Design Name:   ALU
// Module Name:   E:/350/Lab8/ALU/ALUTest.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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
	reg [63:0] BusA;
	reg [63:0] BusB;
	reg [3:0] ALUCtrl;
	reg [7:0] passed;

	// Outputs
	wire [63:0] BusW;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.BusW(BusW), 
		.Zero(Zero), 
		.BusA(BusA), 
		.BusB(BusB), 
		.ALUCtrl(ALUCtrl)
	);

	initial begin
		// Initialize Inputs
		BusA = 0;
		BusB = 0;
		ALUCtrl = 0;
		passed = 0;

        // Here is one example test vector, testing the ADD instruction:
		{BusA, BusB, ALUCtrl} = {64'h1234, 64'hABCD0000, 4'h2}; #40; passTest({Zero, BusW}, 65'h0ABCD1234, "ADD 0x1234,0xABCD0000", passed);

		// ADD Tests
		{BusA, BusB, ALUCtrl} = {64'h2806, 64'h31a6, 4'h2}; #40; passTest({Zero, BusW}, {1'h0, 64'h59ac}, "ADD1", passed);
		{BusA, BusB, ALUCtrl} = {64'hcbe1, 64'h9bcf, 4'h2}; #40; passTest({Zero, BusW}, {1'h0, 64'h167b0}, "ADD2", passed);
		{BusA, BusB, ALUCtrl} = {64'h844c, 64'h4209, 4'h2}; #40; passTest({Zero, BusW}, {1'h0, 64'hc655}, "ADD3", passed);
		
		// Sub Tests
		{BusA, BusB, ALUCtrl} = {64'hfc58, 64'hbbd1, 4'h6}; #40; passTest({Zero, BusW}, {1'h0, 64'h4087}, "SUB1", passed);
		{BusA, BusB, ALUCtrl} = {64'h67f3, 64'h5352, 4'h6}; #40; passTest({Zero, BusW}, {1'h0, 64'h14a1}, "SUB2", passed);
		{BusA, BusB, ALUCtrl} = {64'hd184, 64'h56a9, 4'h6}; #40; passTest({Zero, BusW}, {1'h0, 64'h7adb}, "SUB3", passed);
		
		// Or Tests
		{BusA, BusB, ALUCtrl} = {64'h55c1, 64'h609d, 4'h1}; #40; passTest({Zero, BusW}, {1'h0, 64'h75dd}, "OR1", passed);
		{BusA, BusB, ALUCtrl} = {64'h914d, 64'h2e81, 4'h1}; #40; passTest({Zero, BusW}, {1'h0, 64'hbfcd}, "OR2", passed);
		{BusA, BusB, ALUCtrl} = {64'h8676, 64'h45c7, 4'h1}; #40; passTest({Zero, BusW}, {1'h0, 64'hc7f7}, "OR3", passed);
		
		//And Tests
		{BusA, BusB, ALUCtrl} = {64'hc95b, 64'h3157, 4'h0}; #40; passTest({Zero, BusW}, {1'h0, 64'h153}, "AND1", passed);
		{BusA, BusB, ALUCtrl} = {64'hc728, 64'h4c8e, 4'h0}; #40; passTest({Zero, BusW}, {1'h0, 64'h4408}, "AND2", passed);
		{BusA, BusB, ALUCtrl} = {64'ha011, 64'h120d, 4'h0}; #40; passTest({Zero, BusW}, {1'h0, 64'h1}, "AND3", passed);
		
		//PassB Tests
		{BusA, BusB, ALUCtrl} = {64'h9bf5, 64'h5621, 4'h7}; #40; passTest({Zero, BusW}, {1'h0, 64'h5621}, "PASSB1", passed);
		{BusA, BusB, ALUCtrl} = {64'hf0d7, 64'h4ad0, 4'h7}; #40; passTest({Zero, BusW}, {1'h0, 64'h4ad0}, "PASSB2", passed);
		{BusA, BusB, ALUCtrl} = {64'h1c45, 64'he863, 4'h7}; #40; passTest({Zero, BusW}, {1'h0, 64'he863}, "PASSB3", passed);
		//Reformate and add your test vectors from the prelab here following the example of the testvector above.	


		allPassed(passed, 16); // 16 tests were given, so 16 must pass
	end
      
endmodule

