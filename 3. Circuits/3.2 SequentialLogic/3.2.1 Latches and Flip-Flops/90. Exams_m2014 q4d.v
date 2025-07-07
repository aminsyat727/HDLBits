module top_module (
    input clk,
    input in, 
    output out);

    
    wire xor1;
    reg q;
    
    assign xor1 = in ^ out;
    
    always @(posedge clk) begin
        out <= xor1;

    end
    
endmodule
