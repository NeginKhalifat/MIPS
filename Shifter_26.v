`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:56 06/11/2019 
// Design Name: 
// Module Name:    shifter26 
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
module Shifter_26(
  Data_in,
  Data_out
    );
input[25:0] Data_in;
output[27:0] Data_out;

assign Data_out = Data_in<<2;

endmodule