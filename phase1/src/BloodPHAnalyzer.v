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
** Module Name: BloodPHAnalyzer
**********************************************************
** Additional Comments:

	bloodPH[3] = A
	bloodPH[2] = B
	bloodPH[1] = C
	bloodPH[0] = D

	pH		abnormalityP	abnormalityQ

	0000			1					1
	0001			1					1
	0010			1					1
	0011			1					1
	0100			1					1
	0101			1					1
	0110			1					0
	0111			0					0
	1000			0					0
	1001			1					0
	1010			1					1
	1011			1					1
	1100			1					1
	1101			1					1
	1110			1					1
	1111			1					1

	karnough table for abnormalityP:

  \AB                        
 CD\_________________________
    |     |     |     |     |
    |  1  |  1  |  1  |  0  |
    |_____|_____|_____|_____|
    |     |     |     |     |
    |  1  |  1  |  1  |  1  |
    |_____|_____|_____|_____|
    |     |     |     |     |
    |  1  |  0  |  1  |  1  |
    |_____|_____|_____|_____|
    |     |     |     |     |
    |  1  |  1  |  1  |  1  |
    |_____|_____|_____|_____|
	 
	 f(A,B,C,D) --POS--> (A'+ B + C + D)(A + B'+ C'+ D')
	 
	 ----------------------------------------------
	 karnough table for abnormalityQ:
	 
	 \AB                        
 CD\_________________________
    |     |     |     |     |
    |  1  |  1  |  1  |  0  |
    |_____|_____|_____|_____|
    |     |     |     |     |
    |  1  |  1  |  1  |  0  |
    |_____|_____|_____|_____|
    |     |     |     |     |
    |  1  |  0  |  1  |  1  |
    |_____|_____|_____|_____|
    |     |     |     |     |
    |  1  |  0  |  1  |  1  |
    |_____|_____|_____|_____|
	 
	 f(A,B,C,D) --POS--> ( A'+ B + C )( A + B'+ C')

*/

module BloodPHAnalyzer(
        bloodPH,
        abnormalityP,
        abnormalityQ);
	input [3:0] bloodPH;
	output abnormalityP;
	output abnormalityQ;
	wire [3:0] n;
	not n0( n[0], bloodPH[0]),// D'
		n1( n[1], bloodPH[1]), // C'
		n2( n[2], bloodPH[2]), // B'
		n3( n[3], bloodPH[3]); // A'
	wire p1, p2, q1, q2;
	or g1(p1, n[3], bloodPH[2], bloodPH[1], bloodPH[0]), //A'+ B + C + D
		g2(p2, bloodPH[3], n[2], n[1], n[0]), //A + B'+ C'+ D'
		g3(q1, n[3], bloodPH[2], bloodPH[1]), //A'+ B + C
		g4(q2, bloodPH[3], n[2], n[1]); //A + B'+ C'
	and p(abnormalityP, p1, p2),
		q(abnormalityQ, q1,q2);

endmodule
