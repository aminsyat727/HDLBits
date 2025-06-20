module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);

    wire in_and, in_or, in_xor, not_b;
    
    assign not_b = !b;
    assign in_and = a && b;
    assign in_or = a || b;
    assign in_xor = a ^ b;
    
    assign out_and = in_and;
    assign out_or = in_or;
    assign out_xor = in_xor;
    
    assign out_nand = ! in_and;
    assign out_nor = ! in_or;
    assign out_xnor = ! in_xor;
    
    assign out_anotb = a && not_b;
endmodule
