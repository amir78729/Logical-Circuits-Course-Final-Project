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
** Module Name: MUX2_1
**********************************************************
** Additional Comments:
	a 2 to 1 multiplexer
*/
module MUX2_1(a, b, s, o);
	input s;
	input a, b;
	output  o;
	wire s_not,w1,w2;
	not g1(s_not, s);
	and g2(w1, s_not, a);
	and g3(w2, s, b);
	or result(o, w1, w2);
endmodule
