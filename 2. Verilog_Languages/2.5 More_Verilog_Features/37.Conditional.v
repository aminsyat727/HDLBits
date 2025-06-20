module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] minab, mincd;
    
    assign minab = a < b ? a : b; 
    assign mincd = c < d ? c : d;
    
    assign  min = minab < mincd ? minab : mincd;
    
    

endmodule
