module c_multiplier_tb();
  reg[3:0] a, b;
  wire [7:0] result;
  c_multiplier uut(a, b, result);
  initial begin
      a = 4'd4; b = 4'd4;
      #5 a = 4'd3; b = 4'd5;
      #5 a = 4'd9; b = 4'd3;
      #5 $stop;
  end
endmodule
