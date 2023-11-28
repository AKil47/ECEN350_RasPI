module HalfAdd (Cout, Sum, A, B);
	input A, B;
	output Cout, Sum;
	
	wire t1, t2, t3;
	
	// Omitting comments because taken from prelab
	
	//Cout (two NANDS to make an XOR)
	nand nand0(t1, A, B);
	nand nand1(Cout, t1, t1);
	
	//Sum (three NANDS to make an AND)
	nand nand3(t2, t1, A);
	nand nand4(t3, t1, B);
	nand nand5(Sum, t2, t3);
endmodule
