module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
	wire notx3, notx2, notx1;
    wire row2, row3, row5, row7;
    
    assign notx3 = !x3;
    assign notx2 = !x2;
    assign notx1 = !x1;
    
    assign row2 = notx3 && x2 && notx1;
    assign row3 = notx3 && x2 && x1;
    assign row5 = x3 && notx2 && x1;
    assign row7 = x3 && x2 && x1;
    
    assign f = row2 || row3 || row5 || row7;
    
    
endmodule
