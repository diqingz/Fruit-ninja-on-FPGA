
module  fruit( input Reset, frame_clk,
					input [7:0] keycode,
               output [9:0]  fruitX,fruitY, fruitS );
    
    logic [9:0] Fruit_X_Pos, Fruit_X_Motion, Fruit_Y_Pos, Fruit_Y_Motion, Fruit_Size;
	 
    parameter [9:0] Fruit_X_Center=320;  // Center position on the X axis
    parameter [9:0] Fruit_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Fruit_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Fruit_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Fruit_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Fruit_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Fruit_X_Step=1;      // Step size on the X axis
    parameter [9:0] Fruit_Y_Step=1;      // Step size on the Y axis

    assign Fruit_Size = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
	 //Should be changed later if creating different fruits!!!!
   
    always_ff @ (posedge Reset or posedge frame_clk )
//    begin: Move_Ball
	 begin
        if (Reset)  // Asynchronous Reset
        begin 
            Fruit_Y_Motion <= 10'd0; //Fruit_Y_Step;
				Fruit_X_Motion <= 10'd0; //Fruit_X_Step;
				Fruit_Y_Pos <= Fruit_Y_Center;
				Fruit_X_Pos <= Fruit_X_Center;
        end
           
        else 
        begin 
				 if ( (Fruit_Y_Pos + Fruit_Size) >= Fruit_Y_Max )  // Ball is at the bottom edge, BOUNCE!
					  Fruit_Y_Motion <= (~ (Fruit_Y_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (Fruit_Y_Pos - Fruit_Size) <= Fruit_Y_Min )  // Ball is at the top edge, BOUNCE!
					  Fruit_Y_Motion <= Fruit_Y_Step;
					  
				  else if ( (Fruit_X_Pos + Fruit_Size) >= Fruit_X_Max )  // Ball is at the Right edge, BOUNCE!
					  Fruit_X_Motion <= (~ (Fruit_X_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (Fruit_X_Pos - Fruit_Size) <= Fruit_X_Min )  // Ball is at the Left edge, BOUNCE!
					  Fruit_X_Motion <= Fruit_X_Step;
					  
				 else 
					  				 
				case (keycode)
					8'h04 : begin

								Fruit_X_Motion <= -1;//A
								Fruit_Y_Motion<= 0;
							  end
					        
					8'h07 : begin
								
					        Fruit_X_Motion <= 1;//D
							  Fruit_Y_Motion <= 0;
							  end

							  
					8'h16 : begin

					        Fruit_Y_Motion <= 1;//S
							  Fruit_X_Motion <= 0;
							 end
							  
					8'h1A : begin
					        Fruit_Y_Motion <= -1;//W
							  Fruit_X_Motion <= 0;
							 end	 // Ball is somewhere in the middle, don't bounce, just keep moving
					  
				 
  
					default: ;
			   endcase
				 
				 Fruit_Y_Pos <= (Fruit_Y_Pos + Fruit_Y_Motion);  // Update ball position
				 Fruit_X_Pos <= (Fruit_X_Pos + Fruit_X_Motion);
			

		end  
    end
       
    assign BallX = Ball_X_Pos;
   
    assign BallY = Ball_Y_Pos;
   
    assign BallS = Ball_Size;
    

endmodule
