`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:48:42 06/27/2019
// Design Name:   PC_FLIPFLOP
// Module Name:   E:/University/MEMARI/project1/project/pc_flipflop_test.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC_FLIPFLOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pc_flipflop_test;

	// Inputs
	reg [31:0] Data_in;
	reg CLK;
	reg EN;

	// Outputs
	wire [31:0] Data_out;

	// Instantiate the Unit Under Test (UUT)
	PC_FLIPFLOP uut (
		.Data_in(Data_in), 
		.Data_out(Data_out), 
		.CLK(CLK), 
		.EN(EN)
	);

	initial begin
		// Initialize Inputs
		Data_in = 0;
		CLK = 0;
		EN = 0;

		// Wait 100 ns for global reset to finish
		#100;
		CLK=1;
		EN=1;
        Data_in = 0;
		// Add stimulus here

	end
      
endmodule

