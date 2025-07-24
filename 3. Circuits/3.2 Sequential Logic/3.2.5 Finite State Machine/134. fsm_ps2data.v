module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;
    reg [7:0] byte1, byte2, byte3;
    
    // State transition logic (combinational)
    always @ (*) begin
        case (state)
            A : next_state = in[3] ? B : A;
            B : next_state = C;
            C : next_state = D;
            D : next_state = in[3] ? B : A;
        endcase
    end
    
    // State flip-flops (sequential)
    always @ (posedge clk) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end
    
    // Output logic    
    assign done = (state == D);

    // New: Datapath to store incoming bytes.
    
    always @ (posedge clk) begin
        if (reset) begin
            byte1 <=0;
            byte2 <=0;
            byte3 <=0;
        end else begin
            case (next_state)
                B : byte1 = in;
                C : byte2 = in;
                D : byte3 = in;
            endcase
        end
    end
    
    assign out_bytes = {byte1, byte2, byte3};
    

endmodule
