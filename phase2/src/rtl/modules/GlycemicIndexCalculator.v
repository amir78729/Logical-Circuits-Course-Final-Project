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
** Student ID: XXXXXXX
** Student ID: XXXXXXX
**********************************************************
** Module Name: GlycemicIndexCalculator
**********************************************************
** Additional Comments:
*/

module GlycemicIndexCalculator(
        bloodSensor,
        glycemicIndex);
input [7:0] bloodSensor;
output [3:0] glycemicIndex;

reg [3:0] onesCount;
wire [7:0] absuloteValue ;
integer i;
	assign absuloteValue = (bloodSensor[7] == 1'b1)? -bloodSensor: bloodSensor;
	always @(absuloteValue)
	begin
		onesCount = 0;
		for (i = 0; i <= 7; i = i+1) begin
			if (absuloteValue[i] == 1) begin
				onesCount = onesCount + 1;
			end
		end
	end
	assign glycemicIndex = onesCount;
	
endmodule 