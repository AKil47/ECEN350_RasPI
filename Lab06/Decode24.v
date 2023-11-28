module Decode24 ( out , in ) ;
	input [ 1 : 0 ] in ;
	output [ 3 : 0 ] out ;
	
	reg[3:0] temp;
	
	// Using case to reproduce truth table
	always@(*) begin
		case(in)
			2'b11: temp=4'b1000;
			2'b10: temp=4'b0100;
			2'b01: temp=4'b0010;
			2'b00: temp=4'b0001;
			default: temp=4'b0000;
		endcase
	end
	
	// Output of register is bound to wire :)
	assign out = temp;
endmodule
