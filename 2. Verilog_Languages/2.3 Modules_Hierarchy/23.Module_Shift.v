module top_module ( input clk, input d, output q );

    wire inout1; 
    wire inout2;
    
    my_dff ff1 (.clk(clk), .d(d), .q(inout1));
    my_dff ff2 (.clk(clk), .d(inout1), .q(inout2));
    my_dff ff3 (.clk(clk), .d(inout2), .q(q));
    
endmodule
