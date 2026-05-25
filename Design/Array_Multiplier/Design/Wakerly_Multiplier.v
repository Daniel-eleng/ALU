`timescale 1 ns / 100 ps
module Vrbarrel16_tb () ;
 reg [15:0] DIN; // Data inputs
 reg [3:0] S; // Shift amount, 0-15
 reg [2:0] C; // Mode control
 wire [15:0] DOUT; // Data bus output
 integer i, sh, errors;
 parameter SEED = 1;
 task checksh; // Task to compare UUT output (DOUT) with expected (WANT)
 input [15:0] WANT;
 begin
 if (WANT!==DOUT) begin
 errors = errors + 1;
 $display("Error: C=%3b, S=%4b, DIN=%16b, want %16b, got %16b",
 C, S, DIN, WANT, DOUT);
 end
 end
 endtask
 Vrbarrel16_s UUT ( .DIN(DIN), .S(S), .C(C), .DOUT(DOUT) );
 initial begin
 errors = 0; DIN = $random(SEED);
 for (i=0; i<2500; i=i+1) begin // Test 2500 random input data vectors
 DIN = $random; // Apply random data input
 for (sh=0; sh<=15; sh=sh+1) begin // Test all possible shift amounts
 S = sh; // Apply shift amount
 // And test all eight control values
 C = Lrotate; #10 ; checksh(Vrol(DIN,S));
 C = Rrotate; #10 ; checksh(Vror(DIN,S));
 C = Llogical; #10 ; checksh(Vsll(DIN,S));
 C = Rlogical; #10 ; checksh(Vsrl(DIN,S));
 C = Larith; #10 ; checksh(Vsla(DIN,S));
 C = Rarith; #10 ; checksh(Vsra(DIN,S));
 C = unused1; #10 ; checksh(DIN);
 C = unused2; #10 ; checksh(DIN);
 end
 end
 $display("Test done, %0d errors", errors);
 $stop(1);
 end
endmodule