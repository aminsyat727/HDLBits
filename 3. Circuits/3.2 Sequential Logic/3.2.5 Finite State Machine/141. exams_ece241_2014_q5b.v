module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter A= 2'b01, B= 2'b10;
    reg [1:0]state, next_state;
    
    always @(*) begin
        case (state)
            A : begin
                next_state = x ? B : A;
                z = x ? 1 : 0;
            end
            B : begin
                next_state = B;
                z = ~x;
            end
        endcase
        
end
    
    always @ (posedge clk, posedge areset) begin
        if (areset) begin
            state <= A;
            end else
                state <= next_state;
    end

endmodule
