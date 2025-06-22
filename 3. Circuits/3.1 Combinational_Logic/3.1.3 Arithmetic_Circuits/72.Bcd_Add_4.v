module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire temp1, temp2, temp3;
    
    bcd_fadd digit1 ( .a(a[3:0]), .b(b[3:0]), .cin(cin) , .cout(temp1), .sum(sum[3:0]));
    bcd_fadd digit2 ( .a(a[7:4]), .b(b[7:4]), .cin(temp1) , .cout(temp2), .sum(sum[7:4]));
    bcd_fadd digit3 ( .a(a[11:8]), .b(b[11:8]), .cin(temp2) , .cout(temp3), .sum(sum[11:8]));
    bcd_fadd digit4 ( .a(a[15:12]), .b(b[15:12]), .cin(temp3) , .cout(cout), .sum(sum[15:12]));

endmodule
