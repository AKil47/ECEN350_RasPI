module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64; 
   input 	Branch, ALUZero, Uncondbranch; 
   output [63:0] NextPC; 
   
   reg [63:0] temp;

   /* write your code here */ 
   
   always @(*) begin
      temp = CurrentPC;
      if (Uncondbranch) begin // B
         temp = CurrentPC + (SignExtImm64);
      end
      else if(Branch && ALUZero) begin //CBZ
         temp = CurrentPC  + (SignExtImm64);
      end
      else begin // normal increment
         temp = CurrentPC + 4;
      end
   end
   
   assign NextPC = temp; // set the output wire to the computed value
   


endmodule
