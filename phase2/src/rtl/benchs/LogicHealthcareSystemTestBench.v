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
*/

module LogicHealthcareSystemTestBench;

	// Inputs
	reg clock;
	reg request;
	reg confirm;
	reg inputdata;
	reg [5:0] pressureData;
	reg [3:0] bloodPH;
	reg [2:0] bloodType;
	reg [7:0] fdSensorValue;
	reg [7:0] fdFactoryValue;
	reg [7:0] factoryBaseTemp;
	reg [3:0] factoryTempCoef;
	reg [3:0] tempSensorValue;
	reg [7:0] key;
	reg [7:0] data;

	// Outputs
	wire [2:0] abnormaliryWarning;
	wire [5:0] abnormaliryVector;
	wire [6:0] dataP;
	wire [6:0] dataQ;

	// Instantiate the Unit Under Test (UUT)
	LogicHealthcareSystem uut (
		.clock(clock), 
		.request(request), 
		.confirm(confirm), 
		.inputdata(inputdata), 
		.pressureData(pressureData), 
		.bloodPH(bloodPH), 
		.bloodType(bloodType), 
		.fdSensorValue(fdSensorValue), 
		.fdFactoryValue(fdFactoryValue), 
		.factoryBaseTemp(factoryBaseTemp), 
		.factoryTempCoef(factoryTempCoef), 
		.tempSensorValue(tempSensorValue), 
		.key(key), 
		.data(data), 
		.abnormaliryWarning(abnormaliryWarning), 
		.abnormaliryVector(abnormaliryVector), 
		.dataP(dataP), 
		.dataQ(dataQ)
	);


	initial 
    begin
     clock = 0;
	  repeat (100)
	  #20 clock = ~clock;
    end

	initial begin
		// Initialize Inputs
		clock = 0;
		request = 0;
		confirm = 0;
		inputdata = 0;
		pressureData = 0;
		bloodPH = 0;
		bloodType = 0;
		fdSensorValue = 0;
		fdFactoryValue = 0;
		factoryBaseTemp = 0;
		factoryTempCoef = 0;
		tempSensorValue = 0;
		key = 8'b00000110;
		data = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		
		//test of ConfigurationUnit
		//error state
		//#40;
		//request = 1;
		//#80
		//confirm = 1;
		//data = 8'b00000100;
		
		//disable state
		//#120;
		//request = 0;
		//confirm = 0;
		 
		//register state
		//#120;
		//request = 1;
		//#80;
		//confirm = 1;
		//data = 8'b00000110;
		
		
		
		// test of PresureAbnormalityDetector
		pressureData = 6'b000001; // presureAbnormality = 0
		#40;
		pressureData = 6'b100001; // presureAbnormality = 1
		#40;

		// test of BloodAbnormalityDetector
		bloodPH = 4'b0000; 	bloodType = 3'b000; // bloodAbnormality = 1
		#40;
		bloodPH = 4'b1000; 	bloodType = 3'b001; // bloodAbnormality = 0
		#40;
		
		// test of fallDetector
		fdSensorValue = 10; fdFactoryValue = 10; // fallDetected = 1
		#40;
		fdSensorValue = 9; fdFactoryValue = 10; // fallDetected = 0
		#40;

		// test of fallDetector
		factoryBaseTemp = 30; factoryTempCoef = 4; tempSensorValue = 2; // temperatureAbnormality = 1
		#40;
		factoryBaseTemp = 35; factoryTempCoef = 4; tempSensorValue = 2; // temperatureAbnormality = 0
		#40
		
		// test of NervousShockDetector
		#40;
		inputdata = 1;
		#40;
		inputdata = 0;
		#40;
		inputdata = 0;
		#40;
		inputdata = 1;
		#40;
		inputdata = 0;
		#40;
		inputdata = 0;
		#40;
		inputdata = 1;
		#40;
		inputdata = 0;
		#40;
		inputdata = 0;
		#40;
		inputdata = 1;
		
		//test of ConfigurationUnit
		//error state
		//#50;
		//request = 1;
		//#20
		//confirm = 1;
		//#30;
		//data = 8'b00000100;
		
		//disable state
		#40;
		request = 0;
		 
		//register state
		#40;
		request = 1;
		#80;
		confirm = 1;
		data = 8'b00000110;
#200;		
			
	end      
endmodule
