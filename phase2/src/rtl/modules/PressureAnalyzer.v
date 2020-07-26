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
	00000	1
	00001	1
	00010	1
	00011	1
	00100	1
	00101	1
	00110	1
	00111	1
	01000	0
	01001	0
	01010	0
	01011	0
	01100	0
	01101	0
	01110	0
	01111	0
	10000	0
	10001	0
	10010	0
	10011	0
	10100	0
	10101	0
	10110	0
	10111	1
	11000	1
	11001	1
	11010	1
	11011	1
	11100	1
	11101	1
	11110	1
	11111	1
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

