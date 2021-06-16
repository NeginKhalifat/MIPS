`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:40 06/12/2019 
// Design Name: 
// Module Name:    FlipFlop 
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
module FlipFlop(Data_in , Data_out , CLK
    );
input[31:0]Data_in;
input CLK;
output[31:0]Data_out;
reg[31:0]Data_out;

always@(posedge CLK) begin
	 Data_out=Data_in;
end

endmodule


