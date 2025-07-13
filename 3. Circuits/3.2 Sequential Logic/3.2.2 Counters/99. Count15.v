module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
    integer i;
    
    always @ (posedge clk) begin
        if (reset)
            q <= 0;
        else if (q == 16)
            q <= 0;
        else
        for (i = 0; i < 16; i = i +1) begin
            q <= q + 1;
        end
    end
            

endmodule
