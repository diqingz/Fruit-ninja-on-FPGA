
module  fruit( input Reset, frame_clk,
					input [7:0] keycode,
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
		  
			if(newfruit)//if create new fruit on
			begin
			//Set to random values
				Fruit_Y_Pos <= 0;
				Fruit_X_Pos <= //random
				//Set color to fruit color
				Fruit_X_Motion = //random
				Fruit_Y_Motion = //random
			end
			
			else
			begin
		  /// Fruit dropping if reaches midpoint
//				if(Fruit_X_Pos ==((Fruit_X_Max - 2*(Fruit_init - Fruit_X_Min))/2+Fruit_init - Fruit_X_Min))
				Fruit_Y_Motion <= Fruit_Y_Motion + Fruit_Y_Acceleration; // Changes velocity given accleration
				Fruit_Y_Pos = Fruit_Y_Motion + Fruit_Y_Pos;//updating the position
				Fruit_X_Pos = Fruit_X_Motion + Fruit_X_Pos;
			end
		  end
//        else 
//        begin 
//				 if ( (Fruit_Y_Pos + Fruit_Size) >= Fruit_Y_Max )  // Ball is at the bottom edge, BOUNCE!
//					  Fruit_Y_Motion <= (~ (Fruit_Y_Step) + 1'b1);  // 2's complement.
//					  
//				 else if ( (Fruit_Y_Pos - Fruit_Size) <= Fruit_Y_Min )  // Ball is at the top edge, BOUNCE!
//					  Fruit_Y_Motion <= Fruit_Y_Step;
//					  
//				  else if ( (Fruit_X_Pos + Fruit_Size) >= Fruit_X_Max )  // Ball is at the Right edge, BOUNCE!
//					  Fruit_X_Motion <= (~ (Fruit_X_Step) + 1'b1);  // 2's complement.
//					  
//				 else if ( (Fruit_X_Pos - Fruit_Size) <= Fruit_X_Min )  // Ball is at the Left edge, BOUNCE!
//					  Fruit_X_Motion <= Fruit_X_Step;
					  
//			else  

  
					default: ;
			   endcase
				 
				 Fruit_Y_Pos <= (Fruit_Y_Pos + Fruit_Y_Motion);  // Update ball position
				 Fruit_X_Pos <= (Fruit_X_Pos + Fruit_X_Motion);
			

		end  
    end
       
    assign FruitX = Fruit_X_Pos;
   
    assign FruitY = Fruit_Y_Pos;
   
    assign FruitS = Fruit_Size;
    

endmodule
