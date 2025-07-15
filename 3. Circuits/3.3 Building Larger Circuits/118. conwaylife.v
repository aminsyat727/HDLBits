module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 
    
    integer i;
    integer count;
    integer row, col;
    integer tl, tm, tr, ml, mr, bl, bm, br;
    reg [255:0]q_next;
    

    always @ (posedge clk) begin
        if (load)
            q <= data;
        else begin
            for (i = 0; i < 256; i = i + 1) begin
                row = i /16;
                col = i % 16;
                count = 0;
                
                tl = ((row -1 + 16) % 16) * 16 + ((col -1 + 16) % 16);
                tm = ((row -1 + 16) % 16) * 16 + ((col + 16) % 16);
                tr = ((row -1 + 16) % 16) * 16 + ((col +1 + 16) % 16);
                ml = ((row + 16) % 16) * 16 + ((col -1 + 16) % 16);
                mr = ((row + 16) % 16) * 16 + ((col +1 + 16) % 16);
                bl = ((row +1 + 16) % 16) * 16 + ((col -1 + 16) % 16);
                bm = ((row +1 + 16) % 16) * 16 + ((col + 16) % 16);
                br = ((row +1 + 16) % 16) * 16 + ((col +1 + 16) % 16);
                
                count = q[tl] + q[tm] + q[tr] + q[ml] + q[mr] + q[bl] + q[bm] + q[br];
                
                if (count == 2)
                    q[i] <= q[i];  
                else if (count == 3)
                    q[i] <= 1;     
                else
                    q[i] <= 0;
            end

        end
    end
endmodule

