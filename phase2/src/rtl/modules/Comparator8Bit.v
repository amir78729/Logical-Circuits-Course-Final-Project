
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
** Module Name: Comparator8Bit
**********************************************************
** Additional Comments:
	an 8-bit comparator created with 3 cascaded 3-bit comparators
*/
module Comparator8Bit(
        inputP,
        inputQ,
        pLessThanQ,
        pEqualToQ,
        pGraterGreaterThanQ
        );
input [7:0] inputP;
input [7:0] inputQ;
output pLessThanQ;
output pEqualToQ;
output pGraterGreaterThanQ;

	wire lt0, eq0, gt0, lt1, eq1, gt1;
	wire[2:0] endA;
	
	buf (endA[2], 1'b0);
	buf (endA[1], inputP[7]);
	buf (endA[0], inputP[6]);
	
	wire[2:0] endB;
	
	buf (endB[2], 1'b0);
	buf (endB[1], inputQ[7]);
	buf (endB[0], inputQ[6]);
	
	Comparator3Bit 
	  	a(endA, endB, lt1, eq1, gt1, pLessThanQ, pEqualToQ, pGraterGreaterThanQ),
		b(inputP[5:3], inputQ[5:3], lt0, eq0, gt0, lt1, eq1, gt1),
		c(inputP[2:0], inputQ[2:0], 1'b0, 1'b1, 1'b0, lt0, eq0, gt0);
endmodule
