`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:54 06/11/2019 
// Design Name: 
// Module Name:    MultiPlexer 
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
module MultiPlexer(
    Data_in_0,
    Data_in_1,
    Data_in_2,
    sel,
    Data_out
    
    );
	input[31:0] Data_in_0;
	input[31:0] Data_in_1;
	input[31:0] Data_in_2;
   input[1:0] sel;
   output[31:0] Data_out;
   reg[31:0] Data_out;
	always @(Data_in_0,Data_in_1,Data_in_2,sel)
		begin
			if(sel == 0) 
					Data_out = Data_in_0;  //when select signal to the mux is low
			else if(sel ==1)
					Data_out = Data_in_1;  //when select signal to the mux is high
			else
					Data_out = Data_in_2;  
			
		end
    
endmodule
