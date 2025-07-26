module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    parameter S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Cycle=9, Wait=10;

    reg [3:0] state, next_state;
    reg [3:0] delay;
    reg [9:0] cycle;
    reg [3:0] counter;

    //state transition logic
    always @(*) begin
        case (state)
            S     : next_state = data ? S1 : S;
            S1    : next_state = data ? S11 : S;
            S11   : next_state = ~data ? S110 : S11;
            S110  : next_state = data ? B0 : S;
            B0    : next_state = B1;
            B1    : next_state = B2;
            B2    : next_state = B3;
            B3    : next_state = Count;                           
            Count : next_state = (counter == 0 && cycle == 999) ? Wait : Count;           
            Wait  : next_state = ack ? S : Wait;
            default: next_state = S;
        endcase
    end

    always @ (*) begin
        case (state)
            B0	: delay[3] = data;
            B1	: delay[2] = data;
            B2	: delay[1] = data;
            B3	: delay[0] = data;
        endcase
    end
	
    //register logic
    always @(posedge clk) begin
        if (reset) begin
            state <= S;
            counter <= 0;
            cycle <= 0;
        end else begin
            state <= next_state;

            if (state == B3) begin
                counter <= {delay[3:0]};
                cycle <=0;

            end else if (state == Count) begin
                if (cycle == 999) begin
                    cycle <= 0;
                    counter <= counter - 1;
                end else
                    cycle <= cycle + 1;
            end
        end
    end
	
    //output logic
    assign counting = (state == Count);
    assign done = (state == Wait);
    assign count = counter;

endmodule
