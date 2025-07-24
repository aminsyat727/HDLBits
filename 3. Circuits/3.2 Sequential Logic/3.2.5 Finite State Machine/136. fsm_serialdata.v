module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    parameter IDLE=0, START=1, STOP=2, WAIT=3;
    reg [1:0] state, next_state;
    int count;
    
    always @ (*) begin
        case (state)
            IDLE 	: next_state = in ? IDLE : START;
            START 	: next_state = (count == 9) ? (in ? STOP : WAIT) : START;
            STOP	: next_state = in ? IDLE : START;
            WAIT	: next_state = in ? IDLE : WAIT;
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset) begin
            count <= 0;
            state <= IDLE;
        end else begin
            state <= next_state;
            if (next_state == START)
                count <= count + 1;
            else
                count <= 0;
        end
    end
    
    assign done = (state == STOP);

    // New: Datapath to latch input bits.
    reg [7:0] bytes;
    
    always @ (posedge clk) begin
        if (reset)
            bytes = 0;
        else if (state == START)
            bytes[count-1] = in;
    end
    
    assign out_byte = bytes;

endmodule
