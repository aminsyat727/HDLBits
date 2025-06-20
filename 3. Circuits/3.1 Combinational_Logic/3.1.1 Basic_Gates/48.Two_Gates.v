module top_module (
    input in1,
    input in2,
    input in3,
    output out);

    wire xor_not;
    
    assign xor_not = !(in1 ^ in2) ;
    assign out = xor_not ^ in3;
endmodule
