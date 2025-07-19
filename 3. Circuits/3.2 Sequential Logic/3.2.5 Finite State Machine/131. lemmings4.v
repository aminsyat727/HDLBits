module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    
    parameter LEFT = 0, RIGHT = 1, DIG_L = 2, DIG_R = 3, FALL_L = 4, FALL_R = 5, SPLAT= 6;
    
    reg [2:0]state, next_state;
    int counter;
	
    //state transition logic
    always @ (*) begin
        case(state)
            LEFT 	: next_state = (~ground) ? FALL_L : (dig) ? DIG_L : (bump_left) ? RIGHT : LEFT;
            RIGHT 	: next_state = (~ground) ? FALL_R : (dig) ? DIG_R : (bump_right) ? LEFT : RIGHT;
            DIG_L	: next_state = ground ? DIG_L : FALL_L;
            DIG_R	: next_state = ground ? DIG_R : FALL_R;
            FALL_L	: next_state = (~ground) ? FALL_L : (counter >= 20) ? SPLAT : LEFT;
            FALL_R 	: next_state = (~ground) ? FALL_R: (counter >= 20) ? SPLAT : RIGHT;
            SPLAT 	: next_state = SPLAT;
        endcase
    end
    
    //register logic
    always @ (posedge clk, posedge areset) begin
        if (areset) begin
            state <= LEFT;
            counter <= 0;
        end else begin
            if (state == FALL_L || state == FALL_R)
            	counter <= counter + 1;
            else
                counter <= 0;
            
            state <= next_state;
        end        
    end
    
    //output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_L || state == FALL_R);
    assign digging = (state == DIG_L || state == DIG_R);
    
    
    
            
endmodule

