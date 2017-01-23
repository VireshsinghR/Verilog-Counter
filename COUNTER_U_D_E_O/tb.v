`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:02:02 01/23/2017
// Design Name:   UP_DOWN_COUNTER
// Module Name:   F:/Verilog Projects/COUNTER_U_D_E_O/tb.v
// Project Name:  COUNTER_U_D_E_O
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UP_DOWN_COUNTER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb();
reg en,clk,rst,preset,oe,ud;
wire [3:0]out;

UP_DOWN_COUNTER u1 (en, out, clk, rst, preset,oe, ud);	// connect to DUT

initial																	//clock generaton
begin
        clk=0;
forever clk= #10 ~clk;
end

initial
begin
		 en=1; rst=0; preset=0; oe=0; ud=1;
	#60 en=1; rst=0; preset=0; 
	#15 en=1; rst=0; preset=0; oe=1; ud=1;
	#20 en=1; rst=0; preset=0;
	#20 en=1; rst=0; preset=0;
	#20 en=1; rst=0; preset=0; oe=1; ud=0;
	#60 en=1; rst=0; preset=0;
	#60 en=1; rst=0; preset=0;
	#20 en=1; rst=0; preset=0; oe=0; ud=0;
	#60 en=1; rst=0; preset=1;
	#50
$finish;
end
endmodule
