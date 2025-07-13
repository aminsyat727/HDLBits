module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] temp; 
    integer i;
    
    always @ (posedge clk) begin
        temp <= in;
        if (reset)
            out <= 32'b0;
        
        else for (i = 0; i < 32; i = i+1) begin
            if (temp[i] & ~in[i])
                out[i] <= 1;
            else
                out[i] <= out[i]; 
        end
    end
                
                

endmodule
