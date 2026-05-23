`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2026 09:36:05 PM
// Design Name: 
// Module Name: comparator_4bits
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


module comparator_4bits(input [3:0]A,B, output lt, eq, gt);
    wire [3:0] lt_intermediar;
    wire [3:0] eq_intermediar;
    wire [3:0] gt_intermediar;

    comparator_1bit BLOC1(.A(A[0]),.B(B[0]),.gt(gt_intermediar[0]),.lt(lt_intermediar[0]),.eq(eq_intermediar[0]));
    comparator_1bit BLOC2(.A(A[1]),.B(B[1]),.gt(gt_intermediar[1]),.lt(lt_intermediar[1]),.eq(eq_intermediar[1]));
    comparator_1bit BLOC3(.A(A[2]),.B(B[2]),.gt(gt_intermediar[2]),.lt(lt_intermediar[2]),.eq(eq_intermediar[2]));
    comparator_1bit BLOC4(.A(A[3]),.B(B[3]),.gt(gt_intermediar[3]),.lt(lt_intermediar[3]),.eq(eq_intermediar[3]));

    assign eq = eq_intermediar[0] & eq_intermediar[1] & eq_intermediar[2] & eq_intermediar[3];
    assign gt = gt_intermediar[3] | //daca pe bitul 3 avem ">", nu mai avem nevoie de verificari
                (eq_intermediar[3] & gt_intermediar[2]) | // caz2:pe bitul 3 e egalitate, pe bitul 2 avem ">"
                (eq_intermediar[3] & eq_intermediar[2] & gt_intermediar[1]) | //caz3:bitii 3 si 2 sunt egali, pe bitul 1 avem ">"
                (eq_intermediar[3] & eq_intermediar[2] & eq_intermediar[1] & gt_intermediar[0]); // caz4:bitii 3,2 si 1 sunt egali, pe bitul 0 avem ">"
    //Simplificare pentru gt:compara 2 valori bit cu bit
    //Ex: valorile a = 5431 si b = 5430:
    //pas 1:Daca cea mai mare cifra a lui a ar fi > decat cea mai mare cifra a lui b => a > b
    //pas 2:Daca cea mai mare cifra a lui a este = cu cea mai mare cifra a lui b => comparam urmatoarele 2 cifre... si tot asa
    assign lt = lt_intermediar[3] |
                (eq_intermediar[3] & lt_intermediar[2]) |
                (eq_intermediar[3] & eq_intermediar[2] & lt_intermediar[1]) |
                (eq_intermediar[3] & eq_intermediar[2] & eq_intermediar[1] & lt_intermediar[0]);
    
endmodule
