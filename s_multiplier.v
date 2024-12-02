module s_multiplier(input clk, input reset, input en, input[3:0] a, input[3:0] b, output[7:0] result);
    parameter IDLE=0, MULTIPLY=1, UPDATE=2, DONE=3;
   
    reg[2:0] CS, NS;
    reg[7:0] prod, mcand;
    reg[2:0] shift_count;
    reg[3:0] mplier;
   
    reg[7:0] prod_result;
   
    initial begin
        prod_result <= 0;
        CS <= IDLE;
        NS <= IDLE;
    end
   
   
    always@(posedge clk) begin
   
        if(reset==1)
            CS = IDLE;
        else
            CS = NS;
           
        case(CS)
            IDLE:begin
                mcand <= {4'b0, b};
                mplier <= a;
                shift_count <= 0;
                prod <= 8'b0;
                if (en)
                    NS <= MULTIPLY;
                else
                    NS <= IDLE;
            end
           
            MULTIPLY:begin
                NS <= UPDATE;
                if (shift_count <4) begin
                    if (mplier[0] == 1)
                        prod <= prod + mcand;
                    shift_count <= shift_count + 1;                  
                    mcand <= mcand<<1;
                    mplier <= mplier>>1;  
                end
            end
           
            UPDATE:begin
                if (shift_count==4) begin
                    NS <= DONE;
                    prod_result <= prod;
                end
                else
                    NS <= MULTIPLY;
            end
           
            DONE:begin
                NS <= IDLE;
            end
       
        endcase
    end
    assign result = prod_result;
endmodule
