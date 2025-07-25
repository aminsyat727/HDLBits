module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);

    parameter SNT=0, WNT=1, WT=2, ST=3;
    reg [1:0] current_state, next_state;
    
    always @ (*) begin
        case (current_state)
            SNT	:next_state = train_valid ? (train_taken ? WNT : SNT) : SNT;
            WNT	:next_state = train_valid ? (train_taken ? WT : SNT) : WNT;
            WT	:next_state = train_valid ? (train_taken ? ST : WNT) : WT;
            ST	:next_state = train_valid ? (train_taken ? ST : WT) : ST;
        endcase
    end
    
    always @ (posedge clk, posedge areset) begin
        if (areset)
            current_state <= WNT;
        else
            current_state <= next_state;
    end
        
    assign state[0] = (current_state == WNT || current_state == ST);
        assign state[1] = (current_state == WT || current_state == ST);
        
endmodule
