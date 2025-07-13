module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    reg temp [99:0];
    assign temp[0] = cin;
    bcd_fadd bcd0 (a[3:0], b[3:0], temp[0], temp[1], sum[3:0]);
    
    
    genvar g;
    generate
        for (g = 4; g < 396; g = g + 4) begin : gen
            bcd_fadd bcd (a[g + 3 : g], b[g + 3 : g], temp[(g / 4)], temp[(g / 4) + 1], sum[g + 3: g]) ;
        end
    endgenerate
    
    bcd_fadd bcdlast (a[399:396], b[399:396], temp[99], cout, sum[399:396]);

endmodule
