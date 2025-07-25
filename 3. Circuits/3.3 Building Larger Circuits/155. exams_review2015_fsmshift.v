module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter A=0, B=1, C=2;
    reg  state, next_state;
    int count;
    
    always @ (*) begin
        case (state)
            A : next_state = reset ? B : A;
            B : next_state =  (count == 4) ? A : B;
        endcase
    end
    
    always @ (posedge clk) begin
        if  (reset) begin
            state <= B;
            count <= 1;
        end else begin
            state <= next_state;
            if (next_state == B)
                count = count + 1;
    	end
    end
    
    assign  shift_ena = (state == B); 
            

endmodule
