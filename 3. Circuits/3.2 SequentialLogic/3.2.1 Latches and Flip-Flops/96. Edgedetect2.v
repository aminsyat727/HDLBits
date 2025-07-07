module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg [7:0] delay;
    
    always  @ (posedge clk) begin
        delay <= in;
        anyedge <= ~delay & in | delay & ~in;
    end

endmodule
