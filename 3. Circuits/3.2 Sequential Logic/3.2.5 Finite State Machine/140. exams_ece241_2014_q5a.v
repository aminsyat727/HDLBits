module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter A=0, B=1, C=2;
    
    reg [1:0] state, next_state;
    reg prev_x;
    
    always @ (*) begin
        case (state)
            A	: next_state = x ? B : A;
            B	: next_state = C;
            C	: next_state = C;
            default : next_state = A;

        endcase
    end
    
    always @ (posedge clk, posedge areset) begin
        if (areset) begin
            state <= A;
            prev_x <= 0;
        
            end else begin
            state <= next_state;
            if (state != A)
                prev_x <= x;
        end
                
    end
    
    
            assign z = (state == C) ? ~prev_x :
        (state == B) ? 1 : 0;
endmodule
