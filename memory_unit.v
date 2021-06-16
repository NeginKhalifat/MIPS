`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:19 06/12/2019 
// Design Name: 
// Module Name:    memory_unit 
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
module memory_unit(Address , Rdata , Wdata , WEn , CLK
    );
input CLK , WEn;
input[31:0]Address , Wdata;
output[31:0] Rdata;
reg [7:0] memory [124:0];
assign Rdata = {memory[Address],memory[Address+1],memory[Address+2],memory[Address+3]};

always @(posedge CLK) begin
	if(WEn==1)begin
		memory[Address] = Wdata;
	end
end

initial begin
 // 
//memory[0] = 8'b10001100;//lw   reg[1] = mem[reg[3]+1]
//memory[1] = 8'b01100001;//lw
//memory[2] = 8'b00000000;//lw
//memory[3] = 8'b00000001;//lw
memory[0] = 8'b00000000;//JALR   reg[31]=pc   pc=reg[5]   
memory[1] = 8'b10100000;//JALR
memory[2] = 8'b11111000;//JALR
memory[3] = 8'b00001001;//JALR

//memory[0] = 8'b00000000;//add reg[2] = reg[0] + reg[1]
//memory[1] = 8'b00000001;//add
//memory[2] = 8'b00010000;//add
//memory[3] = 8'b00100000;//add

memory[4] = 8'b00000000;//sub   reg[8] = reg[4] - reg[7]
memory[5] = 8'b10000111;//sub
memory[6] = 8'b01000000;//sub
memory[7] = 8'b00100010;//sub

//memory[12] = 8'b00010110;//bneq
//memory[13] = 8'b00110000;//bneq
//memory[14] = 8'b00000000;//bneq
//memory[15] = 8'b00000010;//bneq

//memory[0] = 8'b00000011;//Jr    jump to reg[24]
//memory[1] = 8'b00000000;//Jr
//memory[2] = 8'b00000000;//Jr
//memory[3] = 8'b00001000;//Jr

memory[24] = 8'b00010010;//beq
memory[25] = 8'b11101110;//beq
memory[26] = 8'b00000000;//beq
memory[27] = 8'b00000010;//beq

memory[8] = 8'b00001000;//J  
memory[9] = 8'b00000000;//J
memory[10] = 8'b00000000;//J
memory[11] = 8'b00010000;//J


memory[20] = 8'b00001100;//JAL
memory[21] = 8'b00000000;//JAL
memory[22] = 8'b00000000;//JAl
memory[23] = 8'b0000010;//JAL

//memory[24] = 8'b10101101;//sw   mem[reg[15]+2]=reg[14]
//memory[25] = 8'b11101110;//sw
//memory[26] = 8'b00000000;//sw
//memory[27] = 8'b00000010;//sw

memory[28] = 8'b00001000;//J     jump to mem[4]
memory[29] = 8'b00000000;//J
memory[30] = 8'b00000000;//J
memory[31] = 8'b00000001;//J
//memory[24] =32'b00000000000000010001000000100000 ;
//memory[28] =32'b00000000000000010001000000100000 ;

end

endmodule
