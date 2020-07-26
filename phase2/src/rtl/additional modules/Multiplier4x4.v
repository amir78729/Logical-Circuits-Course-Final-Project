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
** Module Name: Multiplier4x4
**********************************************************
** Additional Comments:
	an 4x4-bit multiplier using full-Adders
*/
module Multiplier4x4(p,a,b);
	input [3:0]a,b;
	output [7:0]p;
	wire [39:0]w;

	and a1(w[0],a[0],b[0]);
	and a2(w[1],a[1],b[0]);
	and a3(w[2],a[2],b[0]);
	and a4(w[3],a[3],b[0]);

	and a5(w[4],a[0],b[1]);
	and a6(w[5],a[1],b[1]);
	and a7(w[6],a[2],b[1]);
	and a8(w[7],a[3],b[1]);

	and a9(w[8],a[0],b[2]);
	and a10(w[9],a[1],b[2]);
	and a11(w[10],a[2],b[2]);
	and a12(w[11],a[3],b[2]);

	and a13(w[12],a[0],b[3]);
	and a14(w[13],a[1],b[3]);
	and a15(w[14],a[2],b[3]);
	and a16(w[15],a[3],b[3]);

	//assign p[0]=w[0];
	buf(p[0],w[0]);
	
	fullAdder a17(1'b0,w[1],w[4],w[16],w[17]);
	fullAdder a18(1'b0,w[2],w[5],w[18],w[19]);
	fullAdder a19(1'b0,w[3],w[6],w[20],w[21]);

	fullAdder a20(w[8],w[17],w[18],w[22],w[23]);
	fullAdder a21(w[9],w[19],w[20],w[24],w[25]);
	fullAdder a22(w[10],w[7],w[21],w[26],w[27]);

	fullAdder a23(w[12],w[23],w[24],w[28],w[29]);
	fullAdder a24(w[13],w[25],w[26],w[30],w[31]);
	fullAdder a25(w[14],w[11],w[27],w[32],w[33]);

	fullAdder a26(1'b0,w[29],w[30],w[34],w[35]);
	fullAdder a27(w[31],w[32],w[35],w[36],w[37]);
	fullAdder a28(w[15],w[33],w[37],w[38],w[39]);

	//assign p[1]=w[16];
	//assign p[2]=w[22];
	//assign p[3]=w[28];
	//assign p[4]=w[34];
	//assign p[5]=w[36];
	//assign p[6]=w[38];
	//assign p[7]=w[39];
	
	buf(p[1], w[16]);
	buf(p[2], w[22]);
	buf(p[3], w[28]);
	buf(p[4], w[34]);
	buf(p[5], w[36]);
	buf(p[6], w[38]);
	buf(p[7], w[39]);

endmodule
