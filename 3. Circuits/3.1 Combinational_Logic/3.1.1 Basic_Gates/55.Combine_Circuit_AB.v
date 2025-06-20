module top_module (input x, input y, output z);
    
    wire z1, z2, z3, z4;


    IA IA1 (.a(x), .b(y), .c(z1));
    IB IB1 (.i(x), .j(y), .k(z2));
    IA IA2 (.a(x), .b(y), .c(z3));
    IB Ib2 (.i(x), .j(y), .k(z4));
    
    assign z = (z1 | z2) ^ (z3 & z4) ;
        
endmodule

module IA (input a, input b, output c);
    
    wire xor1;
    
    assign xor1 = a ^ b;
    assign c = xor1 & a;
endmodule

module IB (input i, input j, output k);
    
    assign k = i == j;
endmodule


    