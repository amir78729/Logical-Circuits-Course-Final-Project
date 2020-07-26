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
** Module Name: MUX4_1
**********************************************************
** Additional Comments:
	a simple 4 to 1 multiplexer(MUX)
*/
module MUX4_1(
    output f,
    input s0,
    input s1,
    input i0,
	 input i1,
	 input i2,
	 input i3);

    wire s0_not, s1_not;

    not n0(s0_not, s0);
    not n1(s1_not, s1);

    wire w0,w1,w2,w3;

    and g0(w0, s1_not, s0_not, i0);
    and g1(w1, s1_not, s0, i1);
    and g2(w2, s1, s0_not, i2);
    and g3(w3, s1, s0, i3);

    or final(f, w0, w1, w2, w3);

endmodule
