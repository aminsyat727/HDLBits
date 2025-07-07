module top_module();
    
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    q7  u0 (.clk(clk), .in(in), .s(s), .out(out));
    
    initial begin
        clk = 0;
        forever
            #5 clk = ~clk;
    end
    
    initial begin
        in = 0;
        #20 in = ~in;
        #10 in = ~in;
        #10 in = ~in;
        #30 in = ~in;
    end
    
    initial begin
        s = 3'b010;
        
        #10 s = 3'b110;
        #10 s = 3'b010;
        #10 s = 3'b111;
        #10 s = 3'b000;
    end
            
            

endmodule
