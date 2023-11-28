`define I 3'b000
`define D 3'b001
`define B 3'b010
`define C 3'b011
`define Z 3'b100
module SignExtender_Example(BusImm, Imm16, Ctrl); 
   output [63:0] BusImm; 
   input [25:0]  Imm16; 
   input [2:0]	 Ctrl; 
   
   reg [63:0] BusImm; //reg so that we can set the output
   
   /*initial begin
     $monitor("[$monitor] Imm16 = 0x%0h, BusImm = 0x%0h", Imm16, BusImm);
   end*/
   
   
    always @(*) begin
        // For each ALU action, do the appropriate manipulation from MIPS green sheet
        case(Ctrl)
            `I: begin BusImm = {{52{Imm16[21]}}, Imm16[21:10]}; end //[21:10] is ALU immediatee
            `D: begin BusImm = {{55{Imm16[20]}}, Imm16[20:12]}; end //[20:12] is DT address
            `B: begin BusImm = {{36{Imm16[25]}}, Imm16[25:0], 2'b0}; end //[25:0] is BR address
            `C: begin BusImm = {{43{Imm16[23]}}, Imm16[23:5], 2'b0}; end //[23:5] is COND BR address
            `Z: begin BusImm = Imm16[20:5]<<(Imm16[22:21]*16);
            end
        endcase
    end
endmodule
