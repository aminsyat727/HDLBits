module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter LEFT = 0, RIGHT =1, FALL = 3;
    reg [1:0]state, next_state, prev_state;

    always @(*) begin
        // State transition logic
        case (state)
            LEFT : 
                if (!ground)
                    next_state = FALL;
           	 	else if (bump_left & bump_right | bump_left)
                    next_state = RIGHT;
                else if (bump_right)
                	next_state = LEFT;
            	else 
                    next_state = state;
            
            RIGHT : 
                if (!ground)
                    next_state = FALL;
            	else if (bump_left & bump_right | bump_right) 
                    next_state = LEFT;
                else if (bump_left)
                	next_state = RIGHT;
            	else
                    next_state = state;

            FALL : 
                if (ground)
                    next_state = prev_state;
            	else
                    next_state = state;
            default : next_state = 1'bxx;
        endcase
                
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset) begin
        state <= LEFT;
        prev_state <= LEFT;
        end else begin
            if (state !== FALL && next_state == FALL)
            	prev_state <= state;
            state <= next_state;
        end
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL);

endmodule


