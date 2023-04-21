//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] FruitX, FruitY, DrawX, DrawY, Fruit_size,
							  input 			[3:0] apple_R, apple_G, apple_B,BKG_R, BKG_G, BKG_B,
                       output logic [7:0]  Red, Green, Blue );
    
    logic Fruit_on;
	 
	  
    unsigned int DistX, DistY, Size;
	 assign DistX = DrawX - FruitX;
    assign DistY = DrawY - FruitY;
    assign Size = Fruit_size;
	///For apple  
    always_comb
    begin:Fruit_on_proc
        if ((DistX < Fruit_size) && (DistY < Fruit_size)) 
            Fruit_on = 1'b1;
        else 
            Fruit_on = 1'b0;
     end 
      
		
		
    always_comb
    begin:RGB_Display
	 
		  //DRAW: Apple
        if ((Fruit_on == 1'b1)) 
        begin 
            Red = apple_R;
            Green = apple_G;
            Blue = apple_B;
				///Draw apple here
        end  
		  
//		  //DRAW: Fruit2
//        else if (Melon_on ==1'b1) //melon on, paint melon
//		  begin
//		      Red = 8'hff;
//            Green = 8'h55;
//            Blue = 8'h00;
//				///Color of Melon
//		  end
		  
		  //DRAW: Background
		  else
        begin 
            Red = BKG_R; 
            Green = BKG_G;
            Blue = BKG_B;
				///Color of background
        end      
    end 
    
endmodule
