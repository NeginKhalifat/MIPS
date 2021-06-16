`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:47:07 06/17/2019
// Design Name:   RegisterFile
// Module Name:   E:/University/MEMARI/project1/project/Reg_file_test.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Reg_file_test;

	// Inputs
	reg [3:0] RInA;
	reg [3:0] RInB;
	reg WEn;
	reg [3:0] RDest;
	reg [31:0] WData;
	reg CLK;

	// Outputs
	wire [31:0] OutA;
	wire [31:0] OutB;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.RInA(RInA), 
		.RInB(RInB), 
		.OutA(OutA), 
		.OutB(OutB), 
		.WEn(WEn), 
		.RDest(RDest), 
		.WData(WData), 
		.CLK(CLK)
	);


	initial begin
		// Initialize Inputs
		RInA = 0;
		RInB = 0;
		WEn = 0;
		RDest = 0;
		WData = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
      RInA = 0;
		RInB = 1;
		WEn = 1;
		RDest = 2;
		WData = 7;  
		// Add stimulus here

	end
	 initial  begin
	 CLK=0;
	
	 forever begin
	#100;
	CLK=~CLK;
end  
end
      
endmodule

