`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:54 06/11/2019 
// Design Name: 
// Module Name:    Controller 
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
module Controller(Clk, Op,Func, PCWrite,
 lorD, MemWrite,  MemtoReg, IRWrite, PCSrc, ALUOp, ALUSrcB, ALUSrcA, RegWrite, RegDst, Branch,BRANCH_EQ_NQ
    );

 input [5:0] Op,Func;
 input Clk;
 output [1:0] ALUOp, ALUSrcB , MemtoReg , RegDst;
 output  PCWrite, lorD, MemWrite,  IRWrite,  ALUSrcA, RegWrite,Branch;
 reg [1:0] ALUOp, ALUSrcB,MemtoReg, RegDst;
 output reg[2:0] PCSrc;
 reg  PCWrite, lorD, MemRead, MemWrite,  IRWrite,  ALUSrcA, RegWrite,Branch;
 reg [4:0] state =0, nextstate; 
 output reg[1:0] BRANCH_EQ_NQ;
 always@(Op)begin
   #200
	if(Op==6'b000100)begin //beq
	BRANCH_EQ_NQ <=0;
	end
	
	else if(Op==6'b000101)begin //bnq
	BRANCH_EQ_NQ <=1;
	end
	end
 parameter S0 = 0;
 parameter S1 = 1;
 parameter S2 = 2;
 parameter S3 = 3;
 parameter S4 = 4;
 parameter S5 = 5;
 parameter S6 = 6;
 parameter S7 = 7;
 parameter S8 = 8;
 parameter S9 = 9;
 parameter S10 = 10;
 parameter S11 = 11;
 parameter S12 = 12;
 parameter S13 = 13;
 parameter S14 = 14;
reg flag=1;
 always@(posedge Clk) begin
	if(flag==1)begin
	state=0;
	flag=0;
	end
	else begin
  state=nextstate;
  end
end     
always @(state , Op ) begin
	  case(state)
		 S0: begin
		 
			ALUSrcA=1'b0;
			lorD= 1'b0;
			IRWrite=1'b1;
			ALUSrcB=2'b01;
			ALUOp= 2'b00;
			PCWrite=1'b1;
			PCSrc=0;
			nextstate=S1;
			MemWrite = 1'b0;
			#10 RegWrite = 1 'b0;
			MemtoReg = 0;
			Branch = 1 'b0; 
			
		 end
		 
		 S1: begin
			ALUSrcA = 1'b0;
			ALUSrcB = 2'b11;
			ALUOp = 2'b00;
			IRWrite = 1'b0;
			PCWrite = 1'b0;
			if(Op == 6 'b000000 && Func == 6'b001000)//JR
				begin
					nextstate = S12;
				end
			else if(Op ==6 'b000000 && Func == 6'b001001)//JALR
				begin
					nextstate = S13;	
				end
			else if(Op == 6 'b000000)//Rtype
				begin
					nextstate = S6;
				end
		 if(Op == 6'b000011)//JAL
			begin
				nextstate = S11;
			end
		 if(Op == 6 'b100011 || Op == 6'b101011)//Lw or Sw
			begin
			  nextstate = S2;
			end
		 if(Op == 6 'b000100  || Op == 6 'b000101 )//Beq or bnq
			begin
			  nextstate = S8;
			end
		 if(Op == 6 'b001000)//Addi
			begin
			  nextstate = S9;
			end
		 
		 if(Op == 6 'b000010)//J
			begin
			  nextstate = S11;
			end
		 end 
		 S2: begin
			ALUSrcA=1'b1;
			ALUSrcB=2'b10;
			ALUOp= 2'b00;
	 
		 if(Op==6'b100011) begin  //if lw 
			nextstate=S3;
			end                            
		 if(Op==6'b101011) begin  // if SW instruction
			nextstate=S5; 
		 end   
			
		 end
		S3: begin
			lorD= 1'b1;
			nextstate=S4;
		 
			
		 end
		S4: begin
			nextstate=S0;
			RegWrite = 1'b1;
			MemtoReg= 1;
			RegDst= 0;
			
		 end
		S5: begin
			lorD= 1'b1;
			nextstate=S0;
			MemWrite=1'b1; 
			
		 end
		S6: begin
			ALUSrcA=1'b1;
			ALUSrcB=2'b00;
			ALUOp= 2'b10;
			nextstate=S7;
			
		 end
		S7: begin
			nextstate=S0;
			RegWrite = 1'b1;
			MemtoReg=0;
			RegDst= 1;
			
		 end
		S8: begin
			ALUSrcA=1'b1;
			ALUSrcB=2'b00;
			ALUOp= 2'b01;
			PCSrc=1;
			nextstate=S0;
			Branch=1'b1;
			
		 end
		S9: begin
			ALUSrcA=1'b1;
			ALUSrcB=2'b10;
			ALUOp= 2'b00;
			nextstate=S0;
			
		 end
		S10: begin
			nextstate=S11;
			RegWrite = 1'b1; 
			MemtoReg= 0;
			RegDst= 0;
			
		 end 
		S11: begin
			PCWrite=1'b1;
			PCSrc=2;
			if(Op == 6'b000011) //JAL
				begin
					nextstate=S14;
				end
			else
			nextstate=S0;
			
		 end
		S12: begin
			PCWrite=1'b1;
			PCSrc=4;
			nextstate=S0;
			
		 end
		S13: begin    //reg[31]=pc
			ALUSrcB=2'b01;
			RegWrite = 1'b1;
			RegDst = 1;
			MemtoReg = 2;
			nextstate = S12;
			
		 end
		 	S14: begin    //reg[31]=pc
			ALUSrcB=2'b01;
			RegWrite = 1'b1;
			RegDst = 2;
			MemtoReg = 2;
			nextstate = S0;
			
		 end
		 
		 
		 endcase
  	end
  
  
endmodule