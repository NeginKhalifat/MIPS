`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:49 06/11/2019 
// Design Name: 
// Module Name:    Mux4_1 
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
module MULTIPLEXER5_1(
    Data_in_0,
    Data_in_1,
	 Data_in_2,
    Data_in_3,
	 Data_in_4,
	 INT,
    sel,
    Data_out,
    EPC
    );
	input[31:0] Data_in_0;
	input[31:0] Data_in_1;
	input INT;
	output EPC;
	reg [31:0]EPC;
	input[31:0] Data_in_2;
	input[31:0] Data_in_3 , Data_in_4;
   input[2:0] sel;
   output[31:0] Data_out;
   reg[31:0] Data_out;
	always @(Data_in_0,Data_in_1,Data_in_2,Data_in_3,Data_in_4,sel)
		begin
			if(INT == 1) begin
					EPC = Data_in_0;
					Data_out = Data_in_3;
			end
			else if(sel == 0) 
					Data_out = Data_in_0;  //when select signal to the mux is low
			else if(sel == 1) 
					Data_out = Data_in_1;  //when select signal to the mux is low
			else if(sel == 2) 
					Data_out = Data_in_2;  //when select signal to the mux is low
			else if(sel == 3) 
					Data_out = Data_in_3;
			else 
					Data_out = Data_in_4;  //when select signal to the mux is high
		end
   


endmodule