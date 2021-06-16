`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:43 06/11/2019 
// Design Name: 
// Module Name:    alu 
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
`define _ADD 'b100000
`define _SUB 'b100010
`define _OR  'b100101
`define _XOR 'b100110
`define _AND 'b100100
module alu(DataA,DataB,Operation,AluResult,Zero,BRANCH_EQ_NQ
    );
	 input [1:0]BRANCH_EQ_NQ;
	 input [31:0] DataA, DataB;  
    input [3:0] Operation;   
	 output [31:0] AluResult;  
    output Zero;      
	 reg [31:0] AluResult;  
    reg Zero;       
	always@(DataA,DataB,Operation)begin
	
			if(Operation== 'b0010 ) begin//add
				AluResult <= DataA+DataB;
			end
			
			if(Operation== 'b0110) begin//sub
				AluResult <= DataA-DataB; 
			end
			
			if(Operation== 'b0000) begin//and
				AluResult <= DataA&DataB;
			end 
			
			if(Operation == 'b0001) begin//or
				AluResult <= DataA|DataB;
			end
			
			if(Operation == 'b0111) begin//set on less than
				if(DataA<DataB)begin
					AluResult <= 1;
				end
				else begin
					AluResult <= 0;
				end
				
				if(Operation == 'b1100) begin//nor
				AluResult <= ~(DataA|DataB);
			end
			end
			
		
			             
			if(DataA==DataB) begin
				if(BRANCH_EQ_NQ==0)begin
					Zero<=1'b1; 
					end
				else if(BRANCH_EQ_NQ==1)begin
					Zero <= 0;
					end
         end 
			
			if(~(DataA == DataB)) begin 
				if(BRANCH_EQ_NQ==0)begin
					Zero<=0; 
					end
				else if(BRANCH_EQ_NQ==1)begin
					Zero <= 1;
					end        
			end 
			
	end 

endmodule
