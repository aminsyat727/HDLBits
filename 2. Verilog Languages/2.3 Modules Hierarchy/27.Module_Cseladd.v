module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire [15:0] lowsum, uppersum1, uppersum0, upperlast;
    wire sel;
    
    add16 lower16 (.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(lowsum[15:0]), .cout(sel));
    add16 add160 (.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(uppersum0[15:0]), .cout(0));
    add16 add161 (.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(uppersum1[15:0]), .cout(0));
    
    assign upperlast = sel? uppersum1 : uppersum0;
	
    assign sum = {upperlast, lowsum};
endmodule
