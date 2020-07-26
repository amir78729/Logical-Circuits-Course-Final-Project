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
** Module Name: fullAdder
**********************************************************
** Additional Comments:
	a full-adder
*/
module fullAdder(Ai,Bi,Ci,Si,Cout);
	input Ai,Bi,Ci;
	output Si,Cout;
	wire x,y,z;
	xor g1(x,Ai,Bi);
	and g2(z,Ai,Bi);
	xor g3(Si,x,Ci);
	and g4(y,x,Ci);
	or g5(Cout,y,z);
endmodule
