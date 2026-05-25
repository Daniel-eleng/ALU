`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 06:47:18 PM
// Design Name: 
// Module Name: comparator_1bit
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

module Top_Multiplier (input [3:0] X, Y,
                       output [7:0] P);
    
    wire [3:0] PP0,PP1,PP2,PP3;
    wire [3:0] S1,S2,S3; // intermediate sums
    wire C1,C2,C3; // intermediate carry
    assign P[0] = PP0[0];
    Partial_Product generator(.X(X),
                              .Y(Y),
                              .PP0(PP0),
                              .PP1(PP1),
                              .PP2(PP2),
                              .PP3(PP3));
                    
    
    cla_4bit MOD1(.c_in(1'b0),
                  .A({1'b0,PP0[3:1]}),
                  .B(PP1),
                  .sum(S1),
                  .c_out(C1));
    
    assign P[1] = S1[0];
    cla_4bit MOD2(.c_in(1'b0),
                  .A({C1,S1[3:1]}),
                  .B(PP2),
                  .sum(S2),
                  .c_out(C2));
            
    assign P[2] = S2[0];
    cla_4bit MOD3(.c_in(1'b0),
                  .A({C2,S2[3:1]}),
                  .B(PP3),
                  .sum(S3),
                  .c_out(C3));

    assign P[7:3] = {C3, S3};
endmodule