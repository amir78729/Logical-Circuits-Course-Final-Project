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
** Module Name: BloodTypeClassification
**********************************************************
** Additional Comments:

	bloodType[2] = A
	bloodType[1] = B
	bloodType[0] = C 

	input	blood	output	
	(ABC)	type	result
	---------------
	000	O-  	1
	001	O+  	1
	010	A-  	0
	011	A+  	0
	100	B-  	0
	101	B+  	1
	110	AB- 	0
	111	AB+ 	0
	
	karnough table:
	
  \AB                        
  C\_________________________
    |     |     |     |     |
    |  1  |  0  |  0  |  0  |
    |_____|_____|_____|_____|
    |     |     |     |     |
    |  1  |  0  |  0  |  1  |
    |_____|_____|_____|_____|
	 
	f(A,B,C) = A'B' + B'C = B'(A' + C)
	
	       _________
	       |       |
	1'b1 ->|       |
	1'b0 ->|  MUX  |
	   C ->|  4:1  |-> bloodClass
	1'b0 ->|       |
	       |_______|
	         |   |
	         A   B	

*/

module BloodTypeClassification(
        bloodType,
        bloodClass);
	input [2:0] bloodType;
	output bloodClass;
	MUX4_1 mux(bloodClass, bloodType[1], bloodType[2], 1'b1, 1'b0, bloodType[0], 1'b0);
endmodule
