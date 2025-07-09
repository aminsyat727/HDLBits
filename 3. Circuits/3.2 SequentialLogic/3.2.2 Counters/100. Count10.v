module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    
    integer i;
    
    always @ (posedge clk) begin
        
            if (q == 9)
                q <= 0;
            else if (reset)
                q <= 0;
            else
                q <= q + 1;
        end

endmodule
