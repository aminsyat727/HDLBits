module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
 
    assign s = a + b; // similar to the problem 69. addition arithmetic handles the addition.
    
    // overflow is the condition when 2 same signed bit addition produce opposite signed numbers.
    // can be check by deriving the Cin bit of n and n-1 or simply comparing the sign of the output with the input.

    assign overflow = (~s[7] && a[7] && b[7] || s[7] && ~a[7] && ~b[7]);
    

endmodule
