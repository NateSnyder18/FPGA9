module c_multiplier(input[3:0] a, input[3:0] b, output[7:0] result);
    wire [3:0] m0;
    wire [4:0] m1;
    wire [5:0] m2;
    wire [6:0] m3;
   
    wire [7:0] s1, s2, s3;
   
    assign m0 = {b[0]&a[3], b[0]&a[2], b[0]&a[1], b[0]&a[0]};
    assign m1 = {b[1]&a[3], b[1]&a[2], b[1]&a[1], b[1]&a[0], 1'b0};
    assign m2 = {b[2]&a[3], b[2]&a[2], b[2]&a[1], b[2]&a[0], 2'b0};
    assign m3 = {b[3]&a[3], b[3]&a[2], b[3]&a[1], b[3]&a[0], 3'b0};
   
    assign s1 = m0;
    assign s2 = s1 + m1;
    assign s3 = s2 + m2;
    assign result = s3 + m3;
endmodule
