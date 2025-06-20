module top_module (
    input in1,
    input in2,
    output out);

    wire not_in2;
    
    assign not_in2 = !in2;
    assign out = not_in2 && in1;
endmodule
