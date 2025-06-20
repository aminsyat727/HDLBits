module top_module (input x, input y, output z);

    wire xor1;
    
    assign xor1 = x ^ y;
    assign z = xor1 & x;
    
endmodule
