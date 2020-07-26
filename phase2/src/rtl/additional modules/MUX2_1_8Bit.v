`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:45 12/17/2019 
// Design Name: 
// Module Name:    MUX2_1_8Bit 
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
module MUX2_1_8Bit(a, b, s, o);
	input s;
	input [7:0] a, b;
	output  [7:0] o;
	MUX2_1 bit0(a[0], b[0], s, o[0]),
		bit1(a[1], b[1], s, o[1]),
		bit2(a[2], b[2], s, o[2]),
		bit3(a[3], b[3], s, o[3]),
		bit4(a[4], b[4], s, o[4]),
		bit5(a[5], b[5], s, o[5]),
		bit6(a[6], b[6], s, o[6]),
		bit7(a[7], b[7], s, o[7]);
endmodule
