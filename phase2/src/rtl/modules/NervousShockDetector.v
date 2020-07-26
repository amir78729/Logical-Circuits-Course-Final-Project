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
** Module Name: NervousShockDetector
**********************************************************
** Additional Comments:
	state table:
		
	Present State |		    Next State	      |	Z1Z2
					  |	inputdata=0	inputdata=1 |
	--------------------------------------------------------
			S0      |	    S0		    S1			00
			S1      |	    S2		    S1			00
			S2      |	    S14		    S3			00
			S3      |	    S4		    S1			00
			S4      |	    S14		    S5			00
			S5      |	    S6		    S1			00
			S6      |	    S14		    S7			00
			S7      |	    S8		    S9			00
			S8      |	    S14		    S10			00
			S9      |	    S2		    S11			00
			S10     |	    S12		    S9			00
			S11     |	    S13		    S1			00
			S12     |	    S14		    S10			11
			S13     |	    S14		    S3			10
			S14     |	    S0		    S15			00
			S15     |	    S16		    S1			00
			S16     |	    S17		    S3			00
			S17     |	    S0		    S18			00
			S18     |	    S19		    S1			00
			S19     |	    S20		    S13			00
			S20     |	    S0		    S18			01
			
		**NOTE**: All of these states are defined in the code.

*/

module NervousShockDetector(
        clock,
        inputdata,
	 	nervousAbnormality);

input clock;
input inputdata;
output [1:0] nervousAbnormality;

//reg reset;
reg [1:0] nervousAbnormality;

	

	parameter S0 = 5'b00000,// initial = got "0" --> output = "00"
		S1 =  5'b00001, // got "1" --> output = "00"
		S2 =  5'b00010, // got "10" --> output = "00"
		S3 =  5'b00011, // got "101" --> output = "00"
		S4 =  5'b00100, // got "1010" --> output = "00"
		S5 =  5'b00101, // got "10101" --> output = "00"
		S6 =  5'b00110, // got "101010" --> output = "00"
		S7 =  5'b00111, // got "1010101" --> output = "00"
		S8 =  5'b01000, // got "10101010" --> output = "00"
		S9 =  5'b01001, // got "10101011" --> output = "00"
		S10 = 5'b01010, // got "101010101" --> output = "00"
		S11 = 5'b01011, // got "101010111" --> output = "00"
		S12 = 5'b01100, // got "1010101010" --> output = "11" ***
		S13 = 5'b01101, // got "1010101110" --> output = "10" ***
		S14 = 5'b01110, // got "100" --> output = "00"
		S15 = 5'b01111, // got "1001" --> output = "00"
		S16 = 5'b10000, // got "10010" --> output = "00"
		S17 = 5'b10001, // got "100100" --> output = "00"
		S18 = 5'b10010, // got "1001001" --> output = "00"
		S19 = 5'b10011, // got "10010010" --> output = "00"
		S20 = 5'b10100; // got "100100100" --> output = "01" ***
		
		reg [4:0] state = S0;//the initial state
		
	
	//next states:
	always @ (posedge clock)begin
		case(state)
			S0:
				if (~inputdata) state = S0; else state = S1;
			S1:
				if (~inputdata) state = S2; else state = S1;
			S2:
				if (~inputdata) state = S14; else state = S3;
			S3:
				if (~inputdata) state = S4; else state = S1;
			S4:
				if (~inputdata) state = S14; else state = S5;
			S5:
				if (~inputdata) state = S6; else state = S1;
			S6:
				if (~inputdata) state = S14; else state = S7;
			S7:
				if (~inputdata) state = S8; else state = S9;
			S8:
				if (~inputdata) state = S14; else state = S10;
			S9:
				if (~inputdata) state = S2; else state = S11;
			S10:
				if (~inputdata) state = S12; else state = S9;
			S11:
				if (~inputdata) state = S13; else state = S1;
			S12:
				if (~inputdata) state = S14; else state = S10;
			S13:
				if (~inputdata) state = S14; else state = S3;
			S14:
				if (~inputdata) state = S0; else state = S15;
			S15:
				if (~inputdata) state = S16; else state = S1;
			S16:
				if (~inputdata) state = S17; else state = S3;
			S17:
				if (~inputdata) state = S0; else state = S18;
			S18:
				if (~inputdata) state = S19; else state = S1;
			S19:
				if (~inputdata) state = S20; else state = S13;
			S20:
				if (~inputdata) state = S0; else state = S18;
		endcase
	end
	
	//outputs:
	always @ (posedge clock)begin
		case (state)
			S12: begin
				nervousAbnormality = 2'b11;
				$monitor ("-------------------------\nstate :  S%d\noutput:  \"%b\" (\"1010101010\" founded!)", state, nervousAbnormality);
			end
			S13: begin
				nervousAbnormality = 2'b10;
				$monitor ("-------------------------\nstate :  S%d\noutput:  \"%b\" (\"1010101110\" founded!)", state, nervousAbnormality);
			end
			S20: begin
				nervousAbnormality = 2'b01;
				$monitor ("-------------------------\nstate :  S%d\noutput:  \"%b\" (\"100100100\" founded!)", state, nervousAbnormality);
			end
			default: begin
				nervousAbnormality = 2'b00;
				$monitor ("-------------------------\nstate :  S%d\noutput:  \"%b\"", state, nervousAbnormality);
			end
		endcase
	end
	
endmodule
