module top_module( 
    input a, b, cin,
    output cout, sum );
    
    //full adder, similar to half adder but includes Cin as input	
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) + (cin & (a ^ b));

endmodule
