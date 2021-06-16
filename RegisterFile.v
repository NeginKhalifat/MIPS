`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:40 06/12/2019 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(RInA,RInB,OutA,OutB,WEn,RDest,WData,CLK , EPC
    );
	input [4:0] RInA,RInB,RDest;
	input CLK,WEn;
	input [31:0] WData , EPC;
	output [31:0] OutA,OutB;
	reg [31:0] RegFile [31:0]; 
	reg [31:0] EPCREG;
  initial begin    //load in data and instructions of program  
  RegFile[0] <= 32'd0;
  RegFile[1] <= 32'd1;    
  RegFile[2] <= 32'd2;
  RegFile[3] <= 32'd3;
  RegFile[4] <= 32'd4;    
  RegFile[5] <= 32'd5;
  RegFile[6] <= 32'd6;
  RegFile[7] <= 32'd7;
  RegFile[8] <= 32'd8;    
  RegFile[9] <= 32'd9;
  RegFile[10] <= 32'd10;
  RegFile[11] <= 32'd11;
  RegFile[12] <= 32'd12;    
  RegFile[13] <= 32'd13;
  RegFile[14] <= 32'd14;
  RegFile[15] <= 32'd15;
  RegFile[16] <= 32'd16;    
  RegFile[17] <= 32'd17;
  RegFile[18] <= 32'd18;
  RegFile[19] <= 32'd19;
  RegFile[20] <= 32'd20;    
  RegFile[21] <= 32'd21;
  RegFile[22] <= 32'd22;
  RegFile[23] <= 32'd23;
  RegFile[24] <= 32'd24;    
  RegFile[25] <= 32'd25;
  RegFile[26] <= 32'd26;
  RegFile[27] <= 32'd27;  
  RegFile[28] <= 32'd28;
  RegFile[29] <= 32'd29;  
  RegFile[30] <= 32'd30;
  RegFile[31] <= 32'd31;  
  
  end 
  always @(EPC)begin
		EPCREG=EPC;
	end
  
	always@(posedge CLK)begin
		if(WEn==1)begin
			RegFile[RDest]<=WData;
		end
	end
assign	 OutA=RegFile[RInA];
assign	 OutB=RegFile[RInB];
	
	
endmodule
