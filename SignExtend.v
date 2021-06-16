`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:58 06/11/2019 
// Design Name: 
// Module Name:    SignExt 
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
module SignExtend(
		Data_in,
		Data_out
    );
	 input [15:0] Data_in ;
	 output [31:0] Data_out ;
	 genvar j,i;
	 wire [31:0] Data_out ;
	 reg flag=0;
	 always @ * begin
			if(Data_in[15]==1)begin
					flag=1;
			end
		end
	


	for (j = 0; j < 16; j	= j +1) begin
		assign Data_out[j]=Data_in[j];
   	end

	for (i = 16; i < 32; i = i +1) begin
		assign	Data_out[i]=flag;
   	end

endmodule
