module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire w_and1, w_and2, w_and3, w_and4;
	assign w_and1 = p1a && p1b && p1c;
    assign w_and2 = p1d && p1e && p1f;
    assign w_and3 = p2a && p2b;
    assign w_and4 = p2c && p2d;
    
    assign p1y = w_and1 || w_and2;
    assign p2y = w_and3 || w_and4;

endmodule