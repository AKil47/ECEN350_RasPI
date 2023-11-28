module Mux21 ( out , in , sel ) ;
	input [ 1 : 0 ] in ;
	input sel ;
	output out ;
	
	wire s_inv;
	wire a0, a1;
	
	not not1(s_inv, sel); // s_inv = !sel
	and and0(a0, s_inv, in[0]); // a0 = s_inv & in[0]
	and and1(a1, sel, in[1]); // a1 = sel & in[1]
	
	or or1(out, a0, a1); // out = a0 | a1
endmodule
