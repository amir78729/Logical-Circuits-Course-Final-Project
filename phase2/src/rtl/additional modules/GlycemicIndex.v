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
** Module Name: GlycemicIndexCalculator
**********************************************************
** Additional Comments:
	I) FINDING ABSOLUTE :
	
	- (bloodSensor) = bloodSensor's 2sComplement
	                = (bloodSensor)' + 1
						 
	bloodSensor[7] will tell us if "bloodSensor" is
	negative or positive:
	
		bloodSensor[7] = 0 -----> POSITIVE
		bloodSensor[7] = 1 -----> NEGATIVE
		
	so we can use a 2:1 multiplexer to fine the absolute
	of bloodSensor:
	
		                _________
	               8   |       |
	 bloodSensor --/-->|       |
	                   |  MUX  |  8
	               8   |  2:1  |--/--> bloodSensorAbs
	-bloodSensor --/-->|       |
	                   |_______|
	                       |   
	                   bloodSensor[7] 

	-------------------------------------------------------------

	II) COUNTING "1" BITS IN "bloodSensorAbs" :
	
	we seperate the bloodSensorAbs into 2 equal parts
	and count "1"s of each part seperately:
	 _________________________         _________________________
    |     |     |     |     |         |     |     |     |     |
    |  7  |  6  |  5  |  4  |         |  3  |  2  |  1  |  0  |
    |_____|_____|_____|_____|         |_____|_____|_____|_____|
	 
	 we alse seperate each part into 2 equal parts:
	 _____________ _____________     _____________ _____________
    |     |     | |     |     |     |     |     | |     |     |
    |  7  |  6  | |  5  |  4  |     |  3  |  2  | |  1  |  0  |
    |_____|_____| |_____|_____|     |_____|_____| |_____|_____|
	 
	 
			_____________ 
			|     |     |  
    each	|  X  |  Y  | has 3 different moods:
			|_____|_____|
	
	1) "0" (00) one,
	2) "1" (01) one, and
	3) "2" (10) one
	
	the 2bit number in paranthesize is number of ones in each
	part that can be generated by:  " { X and Y , X xor Y } "
	because of this table:
	
	X   Y     A(XandY)   B(XxorY)    decimal
	0   0         0          0        0 (00)
	0   1         0          1        1 (01)
	1   0         0          1        1 (01)
	1   1         1          0        2 (11)
	
	by adding this numbers together (by using fullAdders) we can
	calculate number of ones in "bloodSensorAbs" :)
	
*/
module GlycemicIndex(
        bloodSensor,
        glycemicIndex);
		  
	input [7:0] bloodSensor;
	output [3:0] glycemicIndex;
   wire [7:0] bloodSensorPrime, bloodSensor2sComplement, bloodSensorAbs;
	wire cout;
	not n0(bloodSensorPrime[0], bloodSensor[0]),
		n1(bloodSensorPrime[1], bloodSensor[1]),
		n2(bloodSensorPrime[2], bloodSensor[2]),
		n3(bloodSensorPrime[3], bloodSensor[3]),
		n4(bloodSensorPrime[4], bloodSensor[4]),
		n5(bloodSensorPrime[5], bloodSensor[5]),
		n6(bloodSensorPrime[6], bloodSensor[6]),
		n7(bloodSensorPrime[7], bloodSensor[7]);
	Adder8Bit adder(bloodSensorPrime, 8'b00000001, bloodSensor2sComplement, cout);//2sComplement of bloodSensor
	MUX2_1_8Bit absSelector(bloodSensor, bloodSensor2sComplement, bloodSensor[7], bloodSensorAbs);
	
	wire [3:0] a, b;
	wire [2:0] r1, r2;
	wire middleCarry1, middleCarry2, temp1, temp2;
	
	and a3(a[3], bloodSensorAbs[7], bloodSensorAbs[6]);
	xor b3(b[3], bloodSensorAbs[7], bloodSensorAbs[6]);
	
	and a2(a[2], bloodSensorAbs[5], bloodSensorAbs[4]);
	xor b2(b[2], bloodSensorAbs[5], bloodSensorAbs[4]);
	
	and a1(a[1], bloodSensorAbs[3], bloodSensorAbs[2]);
	xor b1(b[1], bloodSensorAbs[3], bloodSensorAbs[2]);
	
	and a0(a[0], bloodSensorAbs[1], bloodSensorAbs[0]);
	xor b0(b[0], bloodSensorAbs[1], bloodSensorAbs[0]);
	
	fullAdder f0(b[3], b[2], 1'b0, r1[0], middleCarry1);
	fullAdder f1(a[3], a[2], middleCarry1, r1[1], r1[2]);
	
	fullAdder f2(b[1], b[0], 1'b0, r2[0], middleCarry2);
	fullAdder f3(a[1], a[0], middleCarry2, r2[1], r2[2]);
	
	fullAdder F0(r1[0], r2[0], 1'b0, glycemicIndex[0], temp1);
	fullAdder F1(r1[1], r2[1], temp1, glycemicIndex[1], temp2);
	fullAdder F2(r1[2], r2[2], temp2, glycemicIndex[2], glycemicIndex[3]);

endmodule
