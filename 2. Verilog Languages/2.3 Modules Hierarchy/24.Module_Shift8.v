module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q);
    
    wire [7:0] inout1, inout2, inout3;
    
    my_dff8 ff1 (.clk(clk), .d(d), .q(inout1));
    my_dff8 ff2 (.clk(clk), .d(inout1), .q(inout2));
    my_dff8 ff3 (.clk(clk), .d(inout2), .q(inout3));
    
    always @ (sel) begin
    	case (sel)
        	 2'b00 : q <= d;
         	2'b01 : q <= inout1;
         	2'b10 : q <= inout2;
         	2'b11 : q <= inout3;
      	endcase
   	end  

endmodule
