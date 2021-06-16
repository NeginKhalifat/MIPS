`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:58 06/12/2019 
// Design Name: 
// Module Name:    FlipFlop_EN 
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
module FlipFlop_EN(Data_in , Data_out , CLK , EN
    );
input[31:0]Data_in;
input CLK;
input EN;
output[31:0]Data_out;
reg[31:0]Data_out;

always@(posedge CLK) begin
	if(EN==1)
	 Data_out<=Data_in;
end

endmodule
