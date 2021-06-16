`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:01 06/11/2019 
// Design Name: 
// Module Name:    CPU 
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
module CPU(CLK, INT , NMI
    );
input CLK , INT , NMI;
//output [31:0] ALUOut,ALUResult,SrcA,SrcB,Inst,Adr,Pc,ImmExt,Data,PcJump;
//output Zero;
wire[31:0] ALU_RESULT, PC,PC1, ADDRESS ,JR_A, INSTRUCTION , DATA , ALUOUT , READ_DATA_A , READ_DATA_B , HUNDRED,FOUR,ONE,EPC; 
wire[31:0] SRCA , SRCB , IMMEXT , PCJUMP , READ_DATA , B , A , WRITE_DATA_REGISTER_FILE ,SHIFT_SIGN_EXTEND , CONCAT_OUT ;
wire [3:0]  ALUCONTROL;
wire [27:0] SHIFT_JUMP;
wire [4:0]DST_REGISTER_FILE ;
wire [1:0] ALUOP, ALUSRCB,BRANCH_EQ_NQ   , MEMTOREG,REGDST;
wire  PCWRITE, IORD, MEMWRITE,  IRWRITE,  ALUSRCA, REGWRITE,BRANCH,ZERO;
wire PCEN;
wire [2:0] PCSRC;
reg FLAG;
assign PCEN = (ZERO & BRANCH)|PCWRITE;
assign HUNDRED = 32'd100;
assign ONE = 32'd1;
assign FOUR = 32'd4;
assign JR_A=0;
reg [31:0] temppc =0;
initial begin
	temppc=0;
	FLAG=1;
end
always@(PC1)begin
	if(FLAG == 1)begin
	FLAG =0;
	temppc=0;
	end
	else begin
		temppc=PC1;
	end
end




// Instantiate the module
PC_FLIPFLOP PC_FLIPFLOP(
    .Data_in(temppc), 
    .Data_out(PC), 
    .CLK(CLK), 
    .EN(PCEN)
    );
	 
	 
	 


// Instantiate the module
MUX2_1 PC_INST(
    .Data_in_0(PC), 
    .Data_in_1(ALUOUT), 
    .sel(IORD), 
    .Data_out(ADDRESS)
    );




// Instantiate the module
memory_unit Memory (
    .Address(ADDRESS), 
    .Rdata(READ_DATA), 
    .Wdata(B), 
    .WEn(MEMWRITE), 
    .CLK(CLK)
    );
FlipFlop_EN INST_FLIPFLOP(
    .Data_in(READ_DATA), 
    .Data_out(INSTRUCTION), 
    .CLK(CLK), 
    .EN(IRWRITE)
    );


// Instantiate the module
FlipFlop DATA_FLIPFLOP(
    .Data_in(READ_DATA), 
    .Data_out(DATA), 
    .CLK(CLK)
    );


// Instantiate the module
MUX_DST_3_1 DSTR_FLIPFLOP (
    .Data_in_0(INSTRUCTION[20:16]), 
    .Data_in_1(INSTRUCTION[15:11]), 
    .Data_in_2(31), 
    .sel(REGDST), 
    .Data_out(DST_REGISTER_FILE)
    );
	 
	 
// Instantiate the module
MultiPlexer WRITE_DATA_FLIPFLOP (
    .Data_in_0(ALUOUT), 
    .Data_in_1(DATA), 
	 .Data_in_2(ALU_RESULT),
    .sel(MEMTOREG), 
    .Data_out(WRITE_DATA_REGISTER_FILE)
    );


// Instantiate the module
RegisterFile REGISTER_FILE(
	 .EPC(EPC),
    .RInA(INSTRUCTION[25:21]), 
    .RInB(INSTRUCTION[20:16]), 
    .OutA(READ_DATA_A), 
    .OutB(READ_DATA_B), 
    .WEn(REGWRITE), 
    .RDest(DST_REGISTER_FILE), 
    .WData(WRITE_DATA_REGISTER_FILE), 
    .CLK(CLK)
    );

// Instantiate the module
FlipFlop READ_A_FLIPFLOP(
    .Data_in(READ_DATA_A), 
    .Data_out(A), 
    .CLK(CLK)
    );

// Instantiate the module
FlipFlop READ_B_FLIPFLOP(
    .Data_in(READ_DATA_B), 
    .Data_out(B), 
    .CLK(CLK)
    );



// Instantiate the module
MUX2_1 SRCA_FLIPFLOP (
    .Data_in_0(PC), 
    .Data_in_1(A), 
    .sel(ALUSRCA), 
    .Data_out(SRCA)
    );

// Instantiate the module
SignExtend SIGN_EXTEND (
    .Data_in(INSTRUCTION[15:0]), 
    .Data_out(IMMEXT)
    );





// Instantiate the module
Shifter_32 shift_JR(
    .Data_in(A), 
    .Data_out(JR_A)
    );



// Instantiate the module
Shifter_32 SHIFTER_IMM (
    .Data_in(IMMEXT), 
    .Data_out(SHIFT_SIGN_EXTEND)
    );
	 

	 
// Instantiate the module
Mux4_1 MUX4 (
    .Data_in_0(B), 
    .Data_in_1(FOUR), 
    .Data_in_2(IMMEXT), 
    .Data_in_3(SHIFT_SIGN_EXTEND), 
    .sel(ALUSRCB), 
    .Data_out(SRCB)
    );


// Instantiate the module
Alu_Control Alu_Control (
    .AluOp(ALUOP), 
    .Func(INSTRUCTION[5:0]), 
    .AluControl(ALUCONTROL)
    );


// Instantiate the module
alu ALU (
	 .BRANCH_EQ_NQ(BRANCH_EQ_NQ),
    .DataA(SRCA), 
    .DataB(SRCB), 
    .Operation(ALUCONTROL), 
    .AluResult(ALU_RESULT), 
    .Zero(ZERO)
    );

// Instantiate the module
FlipFlop ALU_FLIPFLOP(
    .Data_in(ALU_RESULT), 
    .Data_out(ALUOUT), 
    .CLK(CLK)
    );

// Instantiate the module
Shifter_26 instance_name (
    .Data_in(INSTRUCTION[25:0]), 
    .Data_out(SHIFT_JUMP)
    );


// Instantiate the module
Concat CONCAT (
    .PC(PC[31:28]), 
    .Data_in(SHIFT_JUMP), 
    .Data_out(CONCAT_OUT)
    );







// Instantiate the module
MULTIPLEXER5_1 PC_MUX (
    .Data_in_0(ALU_RESULT), 
    .Data_in_1(ALUOUT), 
    .Data_in_2(CONCAT_OUT), 
    .Data_in_3(HUNDRED),  
    .Data_in_4(A*4),
	 .INT(INT),
    .sel(PCSRC), 
    .Data_out(PC1),
	 .EPC(EPC)
    );

// Instantiate the module
Controller Controller (
    .Clk(CLK), 
    .Op(INSTRUCTION[31:26]), 
    .Func(INSTRUCTION[5:0]), 
    .PCWrite(PCWRITE), 
    .lorD(IORD), 
    .MemWrite(MEMWRITE), 
    .MemtoReg(MEMTOREG), 
    .IRWrite(IRWRITE), 
    .PCSrc(PCSRC), 
    .ALUOp(ALUOP), 
    .ALUSrcB(ALUSRCB), 
    .ALUSrcA(ALUSRCA), 
    .RegWrite(REGWRITE), 
    .RegDst(REGDST), 
    .Branch(BRANCH),
	 .BRANCH_EQ_NQ(BRANCH_EQ_NQ)
    );




endmodule