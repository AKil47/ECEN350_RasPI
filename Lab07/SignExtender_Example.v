`define I 2'b00
`define D 2'b01
`define B 2'b10
`define C 2'b11

module SignExtender_Example(BusImm, Imm16, Ctrl); 
   output [63:0] BusImm; 
   input [25:0]  Imm16; 
   input [1:0]	 Ctrl; 
   
   reg [63:0] BusImm; //reg so that we can set the output
   
    always @(*) begin
        // For each ALU action, do the appropriate manipulation from MIPS green sheet
        case(Ctrl)
            `I: begin BusImm = {{52{Imm16[21]}}, Imm16[21:10]}; end //[21:10] is ALU immediatee
            `D: begin BusImm = {{55{Imm16[8]}}, Imm16[20:12]}; end //[20:12] is DT address
            `B: begin BusImm = {{36{Imm16[25]}}, Imm16[25:0], 2'b0}; end //[25:0] is BR address
            `C: begin BusImm = {{43{Imm16[23]}}, Imm16[23:5], 2'b0}; end //[23:5] is COND BR address
        endcase
    end
endmodule
