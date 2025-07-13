module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    

    bcdcount ones (clk, reset, 1'b1, q[3:0]);
    bcdcount tens (clk, reset, ena[1], q[7:4]);
    bcdcount hundreds (clk, reset, ena[2], q[11:8]);
    bcdcount thousands (clk, reset, ena[3], q[15:12]);
    
    assign ena[3] = ((q[11:8] == 4'd9) && ena[2]);
    assign ena[2] = ((q[7:4] == 4'd9) && ena[1]);
    assign ena[1] = (q[3:0] ==4'd9);
    
endmodule

module bcdcount (input clk, input reset, input enable, output reg [3:0] out);
            
    always @(posedge clk) begin
        if (reset)
            out <= 4'd0;
        else if (enable) begin 
            if (out == 4'd9)
                out <= 4'b0000;
            else
                out <= out + 1;
        end
    end
    
endmodule
                
        
            
            
            
            
