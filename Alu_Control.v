`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:18 06/17/2019 
// Design Name: 
// Module Name:    Alu_Control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Alu_Control( AluOp , Func , AluControl
    );
input[1:0]AluOp;
input[5:0]Func;
output[3:0]AluControl;
reg[3:0]AluControl;


always@(AluOp , Func)begin
	if(AluOp==2'b00)begin //sw , lw
		AluControl <= 4'b0010; //add
	end

	else if(AluOp==2'b01)begin //beq
		AluControl <= 4'b0110; //sub
	end
	
	else if(AluOp==2'b10)begin //rtype
		if(Func==6'b100000)begin 
			AluControl <= 4'b0010; //add
		end
		
		if(Func==6'b100010)begin
			AluControl <= 4'b0110; //sub
		end
		
		if(Func==6'b100100)begin
			AluControl <= 4'b0000; //and
		end
		
		if(Func==6'b100101)begin
			AluControl <= 4'b0001; //or
		end
		
		if(Func==6'b101010)begin
			AluControl <= 4'b0111; //set on less than
		end
		 
	end

end
 

endmodule
