`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2026 10:42:54 PM
// Design Name: 
// Module Name: cla_4bit
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


module cla_4bit(input c_in,
                input [3:0] A,
                input [3:0] B,
                output [3:0] sum,
                output c_out);
    
    wire [4:1] carry_bus;
    wire [3:0] prop_bus;
    wire [3:0] gen_bus;

    lookahead_generator GTA(.carry_0(c_in),
                            .prop(prop_bus),
                            .gen(gen_bus),
                            .carry_out(carry_bus));

    cla_1bit MOD1(.A(A[0]),
                  .B(B[0]),
                  .c_in(c_in),
                  .sum(sum[0]),
                  .prop(prop_bus[0]),
                  .gen(gen_bus[0]));

    cla_1bit MOD2(.A(A[1]),
                  .B(B[1]),
                  .c_in(carry_bus[1]),
                  .sum(sum[1]),
                  .prop(prop_bus[1]),
                  .gen(gen_bus[1]));

    cla_1bit MOD3(.A(A[2]),
                  .B(B[2]),
                  .c_in(carry_bus[2]),
                  .sum(sum[2]),
                  .prop(prop_bus[2]),
                  .gen(gen_bus[2]));
    
    cla_1bit MOD4(.A(A[3]),
                  .B(B[3]),
                  .c_in(carry_bus[3]),
                  .sum(sum[3]),
                  .prop(prop_bus[3]),
                  .gen(gen_bus[3]));
        
    assign c_out = carry_bus[4];
endmodule
