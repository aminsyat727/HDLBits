module top_module (
    input clk,
    input d,
    output q
);
    reg posq, negq;
    
    always @  (posedge clk) begin
        posq <= d;
    end
    
    always @ (negedge clk) begin
        negq <= d;
    end
    
    assign q = clk ? posq : negq;
    

endmodule
