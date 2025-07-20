module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

    parameter EMPTY=0, RISE_S1=1, RISE_S2=2, FULL=3, FALL_S2=4, FALL_S1=5;
    
    reg [2:0] state, next_state;
    
    always @ (*) begin
        case (state)
            EMPTY 	: next_state = s[1] ? RISE_S1 : EMPTY;
            RISE_S1	: next_state = s[2] ? RISE_S2 : (s[1] ? RISE_S1 : EMPTY);
            RISE_S2 : next_state = s[3] ? FULL : (s[2] ? RISE_S2 : FALL_S1);
            FULL	: next_state = s[3] ? FULL : FALL_S2;
            FALL_S2 : next_state = s[3] ? FULL : (s[2] ? FALL_S2 : FALL_S1);
            FALL_S1 : next_state = s[2] ? RISE_S2 : (s[1] ? FALL_S1 : EMPTY);
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset)
            state <= EMPTY;
        else
        state <= next_state;
    end
    
    assign fr3 = (state == EMPTY);
    assign fr2 = (state == EMPTY || state == RISE_S1 || state == FALL_S1);
    assign fr1 = (state == EMPTY || state == RISE_S1 || state == RISE_S2 || state == FALL_S1 || state == FALL_S2);
    assign dfr = (state == EMPTY || state == FALL_S1 || state == FALL_S2);
    
        		  
endmodule
