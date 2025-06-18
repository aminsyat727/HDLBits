module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire cout1;
    
    add16 lower16 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(cout1));
    add16 upper16 (.a(a[31:16]), .b(b[31:16]), .cin(cout1), .sum(sum[31:16]), .cout(0));
    
    
    

endmodule
