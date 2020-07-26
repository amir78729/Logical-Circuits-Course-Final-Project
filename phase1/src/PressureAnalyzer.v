`timescale 1ns / 1ps
`default_nettype none

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
** Module Name:PressureAnalyzer
**********************************************************
** Additional Comments:

	input	output
	------------
	00000	0
	00001	0
	00010	0
	00011	0
	00100	0
	00101	0
	00110	0
	00111	0
	01000	1
	01001	1
	01010	1
	01011	1
	01100	1
	01101	1
	01110	1
	01111	1
	10000	1
	10001	1
	10010	1
	10011	1
	10100	1
	10101	1
	10110	1
	10111	0
	11000	0
	11001	0
	11010	0
	11011	0
	11100	0
	11101	0
	11110	0
	11111	0

Karnaugh table:
	
	
  \BC                                  \BC
 DE\_________________________         DE\_________________________
    |     |     |     |     |            |     |     |     |     |
    |  1  |  1  |  0  |  0  |            |  0  |  0  |  1  |  1  |
    |_____|_____|_____|_____|            |_____|_____|_____|_____|
    |     |     |     |     |            |     |     |     |     |
    |  1  |  1  |  0  |  0  |            |  0  |  0  |  1  |  1  |
    |_____|_____|_____|_____|            |_____|_____|_____|_____|
    |     |     |     |     |            |     |     |     |     |
    |  1  |  1  |  0  |  0  |            |  0  |  1  |  1  |  1  |
    |_____|_____|_____|_____|            |_____|_____|_____|_____|
    |     |     |     |     |            |     |     |     |     |
    |  1  |  1  |  0  |  0  |            |  0  |  0  |  1  |  1  |
    |_____|_____|_____|_____|            |_____|_____|_____|_____|
               A=0                                  A=1
	
	f(A,B,C,D,E) --SOP--> A'B' + AB + ACDE
	
	pData[4] = A
	pData[3] = B
	pData[2] = C
	pData[1] = D
	pData[0] = E 

*/

 module PressureAnalyzer(
        pData,
        pWarning);
	input [4:0] pData;
	output pWarning;
	wire [2:0] w;
	wire [4:0] not_pData;
	not n0( not_pData[0], pData[0]),// E'
		n1( not_pData[1], pData[1]), // D'
		n2( not_pData[2], pData[2]), // C'
		n3( not_pData[3], pData[3]), // B'
		n4( not_pData[4], pData[4]); // A'
		
	and g0(w[0], not_pData[4], not_pData[3]),// A'B'
		g1(w[1], pData[4], pData[3]),// AB
		g2(w[2], pData[4],pData[2],pData[1],pData[0]);// ACDE
	or result (pWarning, w[0], w[1], w[2]);//SOP form
	
endmodule

