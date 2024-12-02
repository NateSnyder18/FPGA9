module s_multiplier_tb();
  reg[3:0] a, b;
  reg clk, reset, en;
  wire [7:0] result;
  s_multiplier uut(clk, reset, en, a, b, result);
  always begin
      #5 clk = ~clk;
  end
  initial begin
      a = 4'd15; b = 4'd15; clk = 0; reset = 1; en = 0;
      #10 reset = 0;
      #10 en = 1;
     
      #200 a = 4'd4; b = 4'd5; reset = 1; en = 0;
      #10 reset = 0;
      #10 en = 1;
     
      #200 a = 4'd9; b = 4'd3; reset = 1; en = 0;
      #10 reset = 0;
      #10 en = 1;
      #200 $stop;
  end
endmodule
