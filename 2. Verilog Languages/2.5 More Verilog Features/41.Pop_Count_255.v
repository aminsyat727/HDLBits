module top_module( 
    input [254:0] in,
    output reg [7:0] out );
    
    integer i;
    
    always @(*) begin
        out = 0;
        for (i = 0; i < 255; i = i + 1)
            if (in[i])
                out = out + 1;
    end

endmodule

