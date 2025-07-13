module top_module (input a, input b, input c, output out);//

    
    wire andout;
    wire and3;
    wire d,e;

    andgate inst1 ( andout, a, b, c, d, e );
    
    assign and3 = a & b & c;
    assign out = ~ andout;
    
    always @ (*) begin
        if (and3 == 1) begin
            d = 1;
            e = 1;
        end else begin
            d = 0;
            e = 0;
        end
    end

endmodule
