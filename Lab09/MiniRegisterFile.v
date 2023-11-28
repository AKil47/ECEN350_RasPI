module MiniRegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    // outputs
    output [63:0] BusA;
    output [63:0] BusB;
    
    // inputs
    input [63:0] BusW;
    input [4:0] RA, RB, RW;
    input RegWr;
    input Clk;
    
    //intermediate
    reg [63:0] registers [31:0];
    
    // Set all registers to 0 at start
    //initial begin
        //$monitor("X9 = 0x%0h, X10 = 0x%0h, X11 = 0x%0h, X12 = 0x%0h", registers[9], registers[10], registers[11], registers[12]);
        ////#120; $display("BusWss = 0x%0h", BusW);
    //end


     
    // Send data from registers at RA and RB to BusA and BusB each
    assign BusA = (RA!=5'd31)?registers[RA]:64'b0;
    assign BusB = (RB!=5'd31)?registers[RB]:64'b0;
     
    always @ (negedge Clk) begin    
    
        if(RegWr && RW != 5'd31) begin
            // Write with delay of 3 tics
            registers[RW] <= BusW;
        end
    end
endmodule
