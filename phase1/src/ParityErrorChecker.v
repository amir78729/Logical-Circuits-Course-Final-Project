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
** Module Name: ParityErrorChecker
**********************************************************
** Additional Comments:
    ___________________________________________
    |     |     |     |     |     |     |     |
    |E.PAR|  5  |  4  |  3  |  2  |  1  |  0  |
    |_____|_____|_____|_____|_____|_____|_____|
          \________________DATA_______________/
			 
			 
	for the parity bit:
		1 -> odd
		0 -> even
	-------------------------------
	for the ParityErrorChecker:
		1 or 3 or 5 "1"bits -> 1
		0 or 2 "1"bits -> 0
	-------------------------------	
	if parity bit  =  ParityErrorChecker -> ParityErrorChecker = 0
	   parity bit !=  ParityErrorChecker -> ParityErrorChecker = 1
		
*/

module ParityErrorChecker(
        data,
        error);
input [5:0] data;
output error;
	wire isPressureDataOdd;
	xor g1(isPressureDataOdd, data[0], data[1], data[2], data[3], data[4]);
	xor result(error, isPressureDataOdd, data[5]);
	
endmodule

