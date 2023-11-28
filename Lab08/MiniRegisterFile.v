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
    initial begin
        registers[0] <= 0;
        registers[1] <= 1;
        registers[2] <= 2;
        registers[3] <= 3;
        registers[4] <= 4;
        registers[5] <= 5;
        registers[6] <= 6;
        registers[7] <= 7;
        registers[8] <= 8;
        registers[9] <= 9;
        registers[10] <= 10;
        registers[11] <= 11;
        registers[12] <= 12;
        registers[13] <= 13;
        registers[14] <= 14;
        registers[15] <= 15;
        registers[16] <= 16;
        registers[17] <= 17;
        registers[18] <= 18;
        registers[19] <= 19;
        registers[20] <= 20;
        registers[21] <= 21;
        registers[22] <= 22;
        registers[23] <= 23;
        registers[24] <= 24;
        registers[25] <= 25;
        registers[26] <= 26;
        registers[27] <= 27;
        registers[28] <= 28;
        registers[29] <= 29;
        registers[30] <= 30;
        registers[31] <= 0;
    end


     
    // Send data from registers at RA and RB to BusA and BusB each
    assign #2 BusA = registers[RA];
    assign #2 BusB = registers[RB];
     
    always @ (negedge Clk) begin
    
    
        if(RegWr && RW != 5'd31) begin
            // Write with delay of 3 tics
            registers[RW] <= #3 BusW;
        end
        else begin
            registers[5'd31] <= #3 0; // should always be 0
        end
    end
endmodule
