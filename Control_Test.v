`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:07 06/17/2019
// Design Name:   Controller
// Module Name:   E:/University/MEMARI/project1/project/Control_Test.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Test;

	// Inputs
	reg Clk;
	reg [5:0] Op;
	reg [5:0] Func;

	// Outputs
	wire PCWrite;
	wire lorD;
	wire MemWrite;
	wire MemtoReg;
	wire IRWrite;
	wire [1:0] PCSrc;
	wire [1:0] ALUOp;
	wire [1:0] ALUSrcB;
	wire ALUSrcA;
	wire RegWrite;
	wire RegDst;
	wire Branch;

	// Instantiate the Unit Under Test (UUT)
	Controller uut (
		.Clk(Clk), 
		.Op(Op), 
		.Func(Func), 
		.PCWrite(PCWrite), 
		.lorD(lorD), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.IRWrite(IRWrite), 
		.PCSrc(PCSrc), 
		.ALUOp(ALUOp), 
		.ALUSrcB(ALUSrcB), 
		.ALUSrcA(ALUSrcA), 
		.RegWrite(RegWrite), 
		.RegDst(RegDst), 
		.Branch(Branch)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Op = 0;
		Func = 6'b001001;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
        initial  begin
	 Clk=0;
	
	 forever begin
	#100;
	Clk=~Clk;
end   
end
endmodule

