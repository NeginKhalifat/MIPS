`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:40:50 06/11/2019
// Design Name:   alu
// Module Name:   E:/architecture/project/AluTest.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AluTest;

	// Inputs
	reg [31:0] DataA;
	reg [31:0] DataB;
	reg [5:0] Operation;

	// Outputs
	wire [31:0] AluResult;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.DataA(DataA), 
		.DataB(DataB), 
		.Operation(Operation), 
		.AluResult(AluResult), 
		.Zero(Zero)
	);

	initial begin
		// Initialize Inputs
		DataA = 0;
		DataB = 0;
		Operation = 0;

		// Wait 100 ns for global reset to finish
		#100;
		DataA = 2;
		DataB = 3;
		Operation = 6'b100000;

        
		// Add stimulus here

	end
      
endmodule

