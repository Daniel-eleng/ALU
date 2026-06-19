`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: ALU_Testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ALU_Testbench;
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] Opcode;
    wire [7:0] Result;
    integer i, j, k;

    ALU_Design TEST(.A(A),
                    .B(B),
                    .Opcode(Opcode),
                    .Result(Result));
    initial begin
        $monitor("Opcode = %d | A = %d | B = %d | Result = %d",Opcode,A,B,Result);
        {A,B,Opcode} = 0;
        for(i = 0; i < 16; i = i + 1) begin
            for(j = 0; j < 16; j = j + 1) begin
                for(k = 0; k < 16; k = k + 1) begin
                    A = i;
                    B = j;
                    Opcode = k;
                    #5;
                end
            end
        end
        #500;
        $finish;
    end
endmodule 