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
*/

module ConfigurationUnitTest;

	// Inputs
	reg clock;
	reg request;
	reg confirm;
	reg [7:0] key;
	reg [7:0] inputData;

	// Outputs
	wire [6:0] dataP;
	wire [6:0] dataQ;

	// Instantiate the Unit Under Test (UUT)jjj
	ConfigurationUnit uut (
		.clock(clock), 
		.request(request), 
		.confirm(confirm), 
		.key(key), 
		.inputData(inputData), 
		.dataP(dataP), 
		.dataQ(dataQ)
	);

	always #40 clock = ~clock;
	initial begin
		// Initialize Inputs
		clock = 0;
		request = 0;
		confirm = 0;
		key = 8'b00000110;
		inputData = 8'b00000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//error state
		#50;
		request = 1;
		#20
		confirm = 1;
		#30;
		inputData = 8'b00000100;
		
		//disable state
		#50;
		request = 0;
		 
		//register state
		#50;
		request = 1;
		#20
		confirm = 1;
		#30;
		inputData = 8'b00000110;
		
		//change key
		#50;
		key = 8'b10000110;
		#20
		request = 0;
		
		//error state
		#50;
		request = 1;
		#20
		confirm = 1;
		#30;
		inputData = 8'b00000100;
		
		//disable state
		#50;
		request = 0;
		 
		//register state
		#50;
		request = 1;
		#20
		confirm = 1;
		#30;
		inputData = 8'b10000110;
	end
	
endmodule

