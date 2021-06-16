`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:12:13 07/02/2019
// Design Name:   Shifter_32
// Module Name:   E:/architecture/edition100/project/shift4.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shifter_32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shift4;

	// Inputs
	reg [31:0] Data_in;

	// Outputs
	wire [31:0] Data_out;

	// Instantiate the Unit Under Test (UUT)
	Shifter_32 uut (
		.Data_in(Data_in), 
		.Data_out(Data_out)
	);

	initial begin
		// Initialize Inputs
		Data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
      Data_in = 5;  
		// Add stimulus here

	end
      
endmodule

