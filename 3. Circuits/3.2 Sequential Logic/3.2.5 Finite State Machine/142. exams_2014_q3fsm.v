module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A = 1'b0, B = 1'b1;
    reg state, next_state;
    int cycle_count, w_count;

    // Next state logic
    always @(*) begin
        case (state)
            A: next_state = s ? B : A;
            B: next_state = B;
        endcase
    end

    // Sequential logic
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            cycle_count <= 0;
            w_count <= 1;
            z <= 0;
        end else begin
            state <= next_state;
            z <= 0;

            if (state == B) begin
                if (cycle_count <= 3) begin
                    cycle_count <= cycle_count + 1;
                    w_count = w_count + w;
                end

                if (cycle_count == 3) begin
                    if (w_count == 2)
                        z <= 1;
                    cycle_count <= 1;
                    w_count <= 0;
                end
            end else begin
                cycle_count <= 1;
                w_count <= 0;
            end
        end
    end

endmodule
