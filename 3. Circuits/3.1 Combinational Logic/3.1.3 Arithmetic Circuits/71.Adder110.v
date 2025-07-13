module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
     
    integer i;
    reg temp [99:0];
    
    assign sum[0] = cin ^ a[0] ^ b[0];
    assign temp[0] = (a[0] & b[0]) + (cin & (a[0] ^ b[0]));
    assign cout = (a[99] & b[99]) + (temp[98] & (a[99] ^ b[99]));
        
    always @ (*) begin
        for (i = 1; i < 100; i = i + 1) begin
            
            sum[i] = a[i] ^ b[i] ^ temp[i-1];
            temp[i] = (a[i] & b[i]) + (temp[i-1] & (a[i] ^ b[i]));
        end
    end

endmodule

    // HDLBits solution simply "assign {cout, sum} = a+b+cin;"
    // using vector concatenation. assigning cout to the MSB and sum to other bits