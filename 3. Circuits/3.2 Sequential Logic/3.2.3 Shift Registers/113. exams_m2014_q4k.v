module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    reg [3:0] d;
    assign out = d[3];
    
    always @(posedge clk) begin
        if (!resetn) begin
            d <= 0;
        end else begin
            d = {d[2:0], in};
        end
    end
endmodule
