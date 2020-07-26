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
** Module Name: Comparator3Bit
**********************************************************
** Additional Comments:
	a 3-bit comparator
*/
module Comparator3Bit(
    input [2:0] A,
    input [2:0] B,
    input L,
    input E,
    input G,
    output LT,
    output EQ,
    output Gt);

    wire notA[2:0] , notB[2:0];
    not
        n0(notA[0], A[0]),
        n1(notA[1], A[1]),
        n2(notA[2], A[2]),
        n3(notB[0], B[0]),
        n4(notB[1], B[1]),
        n5(notB[2], B[2]);

    wire eqbit[2:0];
    xnor
        xn0(eqbit[0], A[0], B[0]),
        xn1(eqbit[1], A[1], B[1]),
        xn2(eqbit[2], A[2], B[2]);
    
    wire ltParts[2:0], gtParts[2:0];
    wire isEqu, notisEqu;
	 not n6(notisEqu, isEqu);
	 
    and
        a0(ltParts[0], notA[0], B[0], eqbit[2], eqbit[1]),
        a1(ltParts[1], notA[1], B[1], eqbit[2]),
        a2(ltParts[2], notA[2], B[2]),
        a3(gtParts[0], A[0], notB[0], eqbit[2], eqbit[1]),
        a4(gtParts[1], A[1], notB[1], eqbit[2]),
        a5(gtParts[2], A[2], notB[2]),
        a6(isEqu, eqbit[0], eqbit[1], eqbit[2]);


    // not is eq
    wire gtPreNEqRes, ltPreNEqRes, gtNEqRes, ltNEqRes;
    or
        o0(gtPreNEqRes, gtParts[0], gtParts[1], gtParts[2]),
        o1(ltPreNEqRes, ltParts[0], ltParts[1], ltParts[2]);
    and
        a7(gtNEqRes,notisEqu, gtPreNEqRes),
        a8(ltNEqRes,notisEqu, ltPreNEqRes);

    // is eq
    wire gtEqRes, ltEqRes;
    and
        a9(gtEqRes, isEqu, G),
        a10(ltEqRes, isEqu, L),
        a11(EQ, isEqu, E);
    
    or
        o2(Gt, gtNEqRes, gtEqRes),
        o3(LT, ltNEqRes, ltEqRes);
	
endmodule
