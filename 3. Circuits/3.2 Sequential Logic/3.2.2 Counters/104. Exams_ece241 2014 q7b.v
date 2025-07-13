module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    wire [3:0] Q0, Q1, Q2;
    
    bcdcount ones (clk, reset, c_enable[0], Q0);
    bcdcount tens (clk, reset, c_enable[1], Q1);
    bcdcount hundreds (clk, reset, c_enable[2], Q2);
    
    assign c_enable[2:0] = { Q1 == 4'd9 && Q0 == 4'd9, Q0 == 4'd9, 1'b1};
    assign OneHertz = (Q2 == 4'd9) && (Q1 == 4'd9) && (Q0 == 4'd9);
    

endmodule
