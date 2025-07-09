module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    wire ena_m,ena_h;

    assign ena_m= (ss == 8'h59) ? 1:0;
    assign ena_h= (mm == 8'h59 && ena_m) ? 1:0;

    count59 seconds (clk, reset, ena, ss);
    count59 minutes (clk, reset, ena_m, mm);
    count12 hours (clk, reset, ena_h, hh);

    always @ (posedge clk) begin
        if (reset)
            pm <= 0;
        else 
            pm <= (ss == 8'h59 && 
                   mm == 8'h59 &&
                   hh == 8'h11) ? ~pm : pm;
    end

endmodule


module count59 (input clk, input reset, input ena, output reg [7:0] out);

    always @ (posedge clk) begin
        if (reset)
            out <= 8'd0;
        else if (ena) begin
            if (out[3:0] == 4'd9) begin
                out [3:0] <= 4'd0;
                if (out[7:4] == 4'd5)
                    out [7:4] <= 4'd0;
                else
                    out[7:4] <= out [7:4] + 1;
            end else 
                out [3:0] <= out[3:0] + 1;
        end        
    end
endmodule

module count12 (input clk, input reset, input ena, output reg [7:0] out);

    always @ (posedge clk) begin
        if (reset) begin
            out[7:4] <= 4'd1;
            out[3:0] <= 4'd2;
        end else if (ena) begin
            if (out[7:4] == 4'd1) begin
                if (out[3:0] == 4'd2) begin
                    out[7:4] <= 4'd0;
                    out[3:0] <= 4'd1;
                end else
                    out[3:0] <= out[3:0] + 1;
            end else if (out[3:0] == 4'd9 && out[7:4] == 4'd0) begin
                out[3:0] <= 4'd0;
                out[7:4] <= 4'd1;
            end else
                out[3:0] <= out[3:0] + 1;
        end        
    end
endmodule

