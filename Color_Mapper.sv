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


module  color_mapper(  input Reset_h, VGA_HS, VGA_Clk, blank,
							  input         [9:0]  DrawX, DrawY,
							  input 			[3:0] BKG_R, BKG_G, BKG_B,
                       output logic [7:0]  Red, Green, Blue );
    
    logic Fruit_on,Peach_on;

	 	 
	 //Instantiations and assignments
	 
	 //Apple
	 logic [3:0] apple_R, apple_G, apple_B;
	 logic [9:0] applexsig,appleysig,applesizex,applesizey;
	 logic [9:0] DistX_apple, DistY_apple;
	 assign DistX_apple = DrawX - applexsig;
    assign DistY_apple = DrawY - appleysig;
	 //fruit.sv
	 fruit apple(
		.Reset(Reset_h),
		.frame_clk(VGA_HS),
		.fruitX(applexsig),
		.fruitY(appleysig), 
		.fruitSX(applesizesx),
		.fruitSY(applesizey));
	 //sprite file
	 apple_example apple_sprite(
		.vga_clk(VGA_Clk),
		.DrawX(drawxsig), 
		.DrawY(drawysig),
		.blank(blank),
		.red(apple_R),
		.green(apple_G),
		.blue(apple_B)
);

	 //Peach
	 logic [3:0] peach_R, peach_G, peach_B;
	 logic [9:0] peachxsig,peachysig,peachsizex,peachsizey;
	 logic[9:0] DistX_peach, DistY_peach;
	 assign DistX_peach = DrawX - peachxsig;
    assign DistY_peach = DrawY - peachysig;
	 //fruit.sv
	 fruit peach(
		.Reset(Reset_h),
		.frame_clk(VGA_HS),
		.fruitX(peachxsig),
		.fruitY(peachysig),
		.fruitSX(peachsizesx),
		.fruitSY(peachesizey));
	 //sprite file
	 peach_example peach_sprite(
		.vga_clk(VGA_Clk),
		.DrawX(DrawX), 
		.DrawY(DrawY),
		.blank(blank),
		.red(peach_R),
		.green(peach_G),
		.blue(peach_B)
);

	 
	 
	///For apple  
    always_comb
//    begin:Fruit_on_proc
	 begin
        if ((DistX_apple < applesizex) && (DistY_apple < applesizey)) 
            Fruit_on = 1'b1;
        else 
            Fruit_on = 1'b0;
     end 
	  
	 	///For peach  
    always_comb
//    begin:Fruit_on_proc
	 begin
        if ((DistX_peach < peachsizex) && (DistY_peach < peachsizey)) 
            Peach_on = 1'b1;
        else 
            Peach_on = 1'b0;
     end
      
		
    always_comb
	 begin
//    begin:RGB_Display
	 
		  //DRAW: Apple
        if ((Fruit_on == 1'b1)&&((Red!=apple_R)||(Green!=apple_G||(Blue!=apple_B)))) //implementing transparency
        begin 
            Red = {4'b0,apple_R};
            Green = {4'b0,apple_G};
            Blue = {4'b0,apple_B};
				///Draw apple here
        end  
//		  
//		  //DRAW: Fruit2
        else if ((Peach_on == 1'b1)&&((Red!=peach_R)||(Green!=peach_G||(Blue!=peach_B)))) //implementing transparency
		  begin
            Red = {4'b0,peach_R};
            Green = {4'b0,peach_G};
            Blue = {4'b0,peach_B};
				///Color of Peach
		  end
		  
		  //DRAW: Background
		  else
        begin 
            Red = {4'b0,BKG_R}; 
            Green = {4'b0,BKG_G};
            Blue = {4'b0,BKG_B};
				///Color of background
        end      
    end 
    
endmodule
