// Define constants

`define AND   4'b0000
`define OR    4'b0001
`define ADD   4'b0010
`define SUB   4'b0110
`define PassB 4'b0111


module ALU(BusW, BusA, BusB, ALUCtrl, Zero);
    
    output  [63:0] BusW;
    input   [63:0] BusA, BusB;
    input   [3:0] ALUCtrl;
    output  Zero;
    
    reg     [63:0] BusW;
    
    always @(ALUCtrl or BusA or BusB) begin
    // For each ALU action, do the appropriate response
        case(ALUCtrl)
            `AND: begin BusW = BusA & BusB; end // Bitwise AND
            `OR: begin BusW = BusA | BusB; end // Bitwise OR
            `ADD: begin BusW = BusA + BusB; end // ADD
            `SUB: begin BusW = BusA - BusB; end // SUB
            `PassB: begin BusW = BusB; end // Simply return B
        endcase
    end

    // Zero bit is based on output of BusW
    assign Zero = (BusW == 0);
endmodule
