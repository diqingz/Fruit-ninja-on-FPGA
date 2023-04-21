module fruit_ninja_fsm(
                        input clk,
                        input reset,
                //      input begin_game,
                //      input fruit_color,
                        input [9:0]fruitX, fruitY,
                //      input displayed_fruit,
                //      input displayed_background,
                        input [7:0]  mouse_x,mouse_y,
                        input mouse_click,



                        output move_fruit,
                        output draw_fruit,
                        output new_fruit,
//when having more backgrounds?                 output draw_background,
                        output start_bg,
                        output GG_bg,
                        output GG,
                        output remove_fruit,
                        output [5:0] number_of_fruits_cut


enum logic [2:0] {Before_start, After_start, Background, Start, DISPLAY, MOVE, Colliding, END} curr_state,
next_state;


logic mouse_clicked;


always_comb
begin
        case(curr_state)

                Before_start:
                        if(~begin_game)
                                begin 
                                        next_state = After_start;
                                end
                        else
                                begin
                                        next_state = Before_start;