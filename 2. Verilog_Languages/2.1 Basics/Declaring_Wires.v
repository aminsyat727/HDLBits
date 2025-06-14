`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire i_and1;
    wire i_and2;
    
    assign i_and1 = a && b;
    assign i_and2 = c && d;
    assign out = i_and1 || i_and2;
    assign out_n = !(i_and1 || i_and2);

endmodule