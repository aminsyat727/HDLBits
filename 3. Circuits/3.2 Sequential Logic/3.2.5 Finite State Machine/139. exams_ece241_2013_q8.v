module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter S0=0, S1=1, S2=2;
    reg [1:0] state, next_state;
    
    //register logic
    always @ (posedge clk, negedge aresetn) begin
        if (!aresetn)
            state <= S0;
        else
            state <= next_state;
    end
    
    //state transition logic
    always @ (*) begin
        case (state)
            S0: begin
                next_state = x ? S1 : S0;
                z = 0;
            end
            S1: begin
                next_state = x ? S1 : S2;
                z = 0;
            end
            S2: begin
                next_state = x ? S1 : S0;
                z = x ? 1 : 0;  
            end
        endcase
    end
            
    
    

endmodule
