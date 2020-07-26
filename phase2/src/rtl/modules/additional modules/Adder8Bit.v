`timescale 1ns / 1ps
/*
**********************************************************
** Logic Design Final Project Fall, 2019 Semester
** Amirkabir University of Technology (Tehran Polytechnic)
** Department of Computer Engineering (CEIT-AUT)
** Logic Circuit Design Laboratory
** https://ceit.aut.ac.ir
**********************************************************
** Student ID: 9731078 (Negin HajiSobhani)
** Student ID: 9731096 (Amirhossein Alibakhshi)
**********************************************************
** Module Name: Adder8Bit
**********************************************************
** Additional Comments:
	an 8-bit adder using full-Adders
*/
module Adder8Bit(a,b,s,cout);
	input [7:0] a;
	input [7:0] b;
	output [7:0] s;
	output cout;
	wire [7:0] w;
	wire sel;
	assign sel = 1'b0;//sel = 0 -> sum / sel = 1 -> sub
	xor  xor1(w[0],b[0],sel);
	xor  xor2(w[1],b[1],sel);
	xor  xor3(w[2],b[2],sel);
	xor  xor4(w[3],b[3],sel);
	xor  xor5(w[4],b[4],sel);
	xor  xor6(w[5],b[5],sel);
	xor  xor7(w[6],b[6],sel);
	xor  xor8(w[7],b[7],sel);

	wire x1,x2,x3,x4,x5,x6,x7;
	fullAdder f0(a[0],w[0],sel,s[0],x1);
	fullAdder f1(a[1],w[1],x1,s[1],x2);
	fullAdder f2(a[2],w[2],x2,s[2],x3);
	fullAdder f3(a[3],w[3],x3,s[3],x4);
	fullAdder f4(a[4],w[4],x4,s[4],x5);
	fullAdder f5(a[5],w[5],x5,s[5],x6);
	fullAdder f6(a[6],w[6],x6,s[6],x7);
	fullAdder f7(a[7],w[7],x7,s[7],cout);
	

endmodule
