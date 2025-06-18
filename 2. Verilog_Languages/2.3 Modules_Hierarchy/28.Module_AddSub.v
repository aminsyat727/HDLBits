module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [15:0] lowersum, uppersum;
    wire cout;
    wire [31:0] newb, sub32;

    assign sub32 = {32{sub}};
    assign newb = sub32 ^ b;
    
    add16 lower16 (.a(a[15:0]), .b(newb[15:0]), .cin(sub), .sum(lowersum), .cout(cout));
    add16 upper16 (.a(a[31:16]), .b(newb[31:16]), .cin(cout), .sum(uppersum), .cout(0));
    
    assign sum = {uppersum, lowersum};
                                   

endmodule
