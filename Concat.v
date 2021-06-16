`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:29 06/11/2019 
// Design Name: 
// Module Name:    Concat 
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
module Concat(
PC,Data_in,Data_out
    );

input[3:0] PC;
input[27:0] Data_in;
output[31:0] Data_out;

assign Data_out[31:28] = PC;
assign Data_out[27:0] = Data_in[27:0];

endmodule