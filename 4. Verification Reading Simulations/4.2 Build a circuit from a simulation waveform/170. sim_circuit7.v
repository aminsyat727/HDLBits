module top_module (
    input clk,
    input a,
    output q );
    
    reg delay;
    
    always @(posedge clk) begin
        delay <= a;
        
    end
    
    assign q = ~delay;

endmodule
