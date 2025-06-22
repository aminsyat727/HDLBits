module top_module( 
    input a, b,
    output cout, sum );
    
    //simple one bit half adder, no Cin required		
    assign sum = a ^ b;
    assign cout = a & b;
    
endmodule
