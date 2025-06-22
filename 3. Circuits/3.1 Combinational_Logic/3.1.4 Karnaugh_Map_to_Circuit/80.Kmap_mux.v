module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 

    // the key here is to see through the kmap column by column (AB; the selector bits) and deduce the output per column	
    assign mux_in[0] = c ? 1 : d;
    assign mux_in[1] = 0;
    assign mux_in[2] = d ? 0 : 1;
    assign mux_in[3] = c ? d : 0;
       


endmodule
