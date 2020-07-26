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
** Module Name: TemperatureCalculator
**********************************************************
** Additional Comments:

	temperature = factoryBaseTemp + ((factoryTempCoef * tempSensorValue) / 8)
	  (8bits)        (8bits)              (4bits)            (4bits)
	  
*/

module TemperatureCalculator(
        factoryBaseTemp,
        factoryTempCoef,
        tempSensorValue,
        temperature);
	input [7:0] factoryBaseTemp;
	input [3:0] factoryTempCoef;
	input [3:0] tempSensorValue;
	output [7:0] temperature;
	wire cout;
   wire [7:0] p, divisionBy8;
	Multiplier4x4 m(p, factoryTempCoef, tempSensorValue);
	Adder8Bit adder({3'b000, p[7:3]}, factoryBaseTemp, temperature, cout);
endmodule