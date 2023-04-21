
module  fruit( input Reset, frame_clk,
//					input [7:0] keycode,
               output [9:0]  fruitX,fruitY, fruitS );
    
    logic [9:0] Fruit_X_Pos, Fruit_X_Motion, Fruit_Y_Pos, Fruit_Y_Motion, Fruit_Size, Fruit_init, Fruit_X_Out, Fruit_Y_Out;
	 int Fruit_Y_Acceleration = 9; //Defines acceleration
    parameter [9:0] Fruit_X_Center=320;  // Center position on the X axis
    parameter [9:0] Fruit_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Fruit_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Fruit_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Fruit_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Fruit_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Fruit_X_Step=1;      // Step size on the X axis
    parameter [9:0] Fruit_Y_Step=1 ;      // Step size on the Y axis SPEED?
    assign Fruit_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	 //Should be changed later if creating different fruits!!!!
   
    always_ff @ (posedge Reset or posedge frame_clk )
//    begin: Move_Ball
	 begin
        if (Reset)  // Asynchronous Reset
        begin 
            Fruit_Y_Motion <= 10'd0; //Fruit_Y_Step;
				Fruit_X_Motion <= 10'd0; //Fruit_X_Step;
				Fruit_Y_Pos <= 0;
				Fruit_X_Pos <= 0;
				//Set color to fruit color	
        end
         			
		  else
		  begin
		  
			if(new_fruit)//if create new fruit on
			begin
			//Set to random values
				Fruit_Y_Pos <= Fruit_Y_Max;
				Fruit_X_Pos <= //random
				//Set color to fruit color
				Fruit_X_Motion = //random NEG
				Fruit_Y_Motion = //random
			end
			else if (move_fruit) begin
				
				// set fruit movement speed (number to add)
				if (number_of_fruits_cut <= 3)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 1;
				
				else if (number_of_fruits_cut > 3 && number_of_fruits_cut <= 6)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 2;
				
				else if (number_of_fruits_cut > 6 && number_of_fruits_cut <= 10)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 3;
					
				else if (number_of_fruits_cut > 10 && number_of_fruits_cut <= 15)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 4;
					
				else if (number_of_fruits_cut > 15 && number_of_fruits_cut <= 20)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 5;
					
				else if (number_of_fruits_cut > 20 && number_of_fruits_cut <= 25)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 6;
					
				else if (number_of_fruits_cut > 25 && number_of_fruits_cut <= 30)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 7;
					
				else if (number_of_fruits_cut > 30 && number_of_fruits_cut <= 35)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 8;
					
				else if (number_of_fruits_cut > 35 && number_of_fruits_cut <= 40)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 9;
					
				else if (number_of_fruits_cut > 40 && number_of_fruits_cut <= 45)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 10;
					
				else if (number_of_fruits_cut > 45 && number_of_fruits_cut <= 50)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 11;
					
				else if (number_of_fruits_cut > 50 && number_of_fruits_cut <= 55)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 12;
					
				else if (number_of_fruits_cut > 55 && number_of_fruits_cut <= 69)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 13;
					
				else if (number_of_fruits_cut > 69)
					Fruit_Y_Acceleration <= Fruit_Y_Acceleration + 15;
					
			end //else if
			
//			else
//			begin
//		  /// Fruit dropping if reaches midpoint
////				if(Fruit_X_Pos ==((Fruit_X_Max - 2*(Fruit_init - Fruit_X_Min))/2+Fruit_init - Fruit_X_Min))
//				Fruit_Y_Motion <= Fruit_Y_Motion + Fruit_Y_Acceleration; // Changes velocity given accleration
////				Fruit_Y_Pos = Fruit_Y_Motion + Fruit_Y_Pos;//updating the position
////				Fruit_X_Pos = Fruit_X_Motion + Fruit_X_Pos;
//			end
		  end


  
					default: ;
			   endcase
				 Fruit_Y_Motion <= Fruit_Y_Motion + Fruit_Y_Acceleration; // Changes velocity given accleration
				 Fruit_Y_Pos <= (Fruit_Y_Pos + Fruit_Y_Motion);  // Update ball position
				 Fruit_X_Pos <= (Fruit_X_Pos + Fruit_X_Motion);
			

		end  
    end
       
    assign FruitX = Fruit_X_Pos;
   
    assign FruitY = Fruit_Y_Pos;
   
    assign FruitS = Fruit_Size;
    

endmodule
