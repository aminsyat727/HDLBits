module top_module ();

    reg clk;
    reg reset;
    reg t;
    wire q;
    
    tff u0( .clk(clk), .reset(reset), .t(t), .q(q));
    
    initial begin
        clk = 0;
        forever 
            #5 clk = ~clk;
    end

    initial begin
        reset = 0;
        forever
            #20 reset = ~reset;
    end
    
    initial begin
        t = 0;
        forever
            #50 t = ~t;
    end
endmodule
