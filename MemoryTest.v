`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:08 06/30/2019
// Design Name:   memory_unit
// Module Name:   E:/architecture/newEdition/project/MemoryTest.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryTest;

	// Inputs
	reg [31:0] Address;
	reg [31:0] Wdata;
	reg WEn;
	reg CLK;

	// Outputs
	wire [31:0] Rdata;

	// Instantiate the Unit Under Test (UUT)
	memory_unit uut (
		.Address(Address), 
		.Rdata(Rdata), 
		.Wdata(Wdata), 
		.WEn(WEn), 
		.CLK(CLK)
	);

	initial begin
		// Initialize Inputs
		Address = 0;
		Wdata = 0;
		WEn = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
      Address = 0;
		Wdata = 2;
		WEn = 0;
		CLK = 1;
  
		// Add stimulus here

	end
      
endmodule

