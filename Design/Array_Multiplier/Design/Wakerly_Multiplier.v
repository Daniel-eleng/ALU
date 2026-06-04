`timescale 1ns / 1ps

module Vrmul8x8p(X, Y, P);
    input [7:0] X, Y;
    output reg [15:0] P; 
    
    reg PC [0:7][7:0];  
    reg PCS [0:7][7:0]; 
    reg PCC [0:7][7:0]; 
    
    reg [6:0] RAS; 
    reg [7:0] RAC; 
    integer i, j;
    
    function MAJ;
        input I1, I2, I3;
        MAJ = (I1 & I2) | (I1 & I3) | (I2 & I3);
    endfunction
    
    always @ (*) begin
        for (i=0; i<=7; i=i+1)
            for (j=0; j<=7; j=j+1)
                PC[i][j] = Y[i] ? X [j] : 1'b0; 
                
        for (j=0; j<=7; j=j+1) begin
            PCS[0][j] = PC[0][j]; 
            PCC[0][j] = 1'b0; 
        end
        
        for (i=1; i<=7; i=i+1) begin 
            for (j=0; j<=6; j=j+1) begin
                PCS[i][j] = PC[i][j] ^ PCS[i-1][j+1] ^ PCC[i-1][j];
                PCC[i][j] = MAJ(PC[i][j], PCS[i-1][j+1], PCC[i-1][j]);
            end
            
            PCS[i][7] = PC[i][7];
        end
        
        RAC[0] = 1'b0; 
        for (i=0; i<=6; i=i+1) begin 
            RAS[i] = PCS[7][i+1] ^ PCC[7][i] ^ RAC[i]; 
            RAC[i+1] = MAJ(PCS[7][i+1], PCC[7][i], RAC[i]); 
        end
        for (i=0; i<=7; i=i+1) begin
            P[i] = PCS[i][0]; 
        end
        for (i=8; i<=14; i=i+1) begin
            P[i] = RAS[i-8]; 
        end
        
        P[15] = RAC[7]; 
    end
endmodule