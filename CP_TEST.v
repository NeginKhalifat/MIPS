`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:13:58 06/17/2019
// Design Name:   CPU
// Module Name:   E:/University/MEMARI/project1/project/CP_TEST.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module CP_TEST;



	// Inputs
	
	reg CLK;


	// Instantiate the Unit Under Test (UUT)
	CPU uut (
	
		.CLK(CLK)
	);


	
    initial  begin
	 CLK=0;
	
	 forever begin
	#100;
	CLK=~CLK;
end   
end
endmodule

