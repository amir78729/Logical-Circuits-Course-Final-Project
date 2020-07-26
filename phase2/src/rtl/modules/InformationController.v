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
** Module Name: InformationController
**********************************************************
** Additional Comments:
	states:
	- A (REST)
	- B (ACTIVE)
	- C (REQUEST)
	- D (SAVE)
	- E (TRAP)

*/

module InformationController(
        clock,
        request,
	 	confirm,
	 	password,
	 	user,
	 	writeRegP,
	 	writeRegQ);

input clock;
input request;
input confirm;
input [7:0] password;

//added by me:
input [7:0] user;
output reg writeRegP;
output reg writeRegQ;



	//defining the password:
	//parameter my_password = 8'b11111111;
	
	//defining states:	
	parameter A = 3'b000,//rest
		B = 3'b100,//active
		C = 3'b101,//request
		D = 3'b110,//save
		E = 3'b111;//trap
		reg [2:0] state = A;
		
		always @ (posedge clock or negedge request)
		if (~request) begin
				state = A;  //Initialize to state S0
				$monitor ("State: \" REST \"( %b )", state);
			end
		else
			case(state)
				//rest :
				A: begin
						if (request) state = B;
						$monitor ("State: \" ACTIVE \"( %b )", state);
					end
					
				//active :
				B:	begin
					if (confirm) begin
						if (user == password)begin
							state = C;
							$monitor ("State: \" REQUEST \"( %b )", state);
						end else begin
							state = E;
							$monitor ("State: \" TRAP \"( %b )", state);
						end
					end
				end
				
				//request :
				C: begin
					state = D;
					$monitor ("State: \" SAVE \"( %b )", state);
				end
					
				//save :
				D:	begin
						if (confirm)
						begin
							if (~user[7])begin
								writeRegP = 1'b1;
								writeRegQ = 1'b0;
							end
							else begin
								writeRegP = 1'b0;
								writeRegQ = 1'b1;
							end
							$monitor ("writeRegP: %b / writeRegQ: %b / ", writeRegP, writeRegQ);
						end
					end	
				//trap :
				E:;
			endcase
	
		
	
	
endmodule