// Wallace tree:

`timescale 1ns / 1ps

module partial_product(
    input x,
    input y,
    output pp
    );
    assign pp = x & y;  
endmodule

module not_partial_product(
    input x,
    input y,
    output pp
    );
    assign pp = ~(x & y);  
endmodule

module half_adder(
    input x,
    input y,
    output sum,
    output carry
    );
    assign sum = x ^ y;
    assign carry = x & y;
endmodule

module full_adder(
    input x,
    input y,
    input cin,
    output sum,
    output carry
    );
    assign sum = x ^ y ^ cin;
    assign carry = (x&y) + (cin & (x^y));
endmodule

module bit4_signed_multiplier(
    input [3:0] A,
    input [3:0] B,
    output [8:0] Out
    );
   
    wire p00, p01, p02, p03, p10, p11, p12, p13, p20, p21, p22, p23, p30, p31, p32, p33;
   
    partial_product P1(.x(A[0]), .y(B[0]), .pp(p00));
    partial_product P2(.x(A[1]), .y(B[0]), .pp(p10));
    partial_product P3(.x(A[2]), .y(B[0]), .pp(p20));
    not_partial_product P4(.x(A[3]), .y(B[0]), .pp(p30));
   
    partial_product P5(.x(A[0]), .y(B[1]), .pp(p01));
    partial_product P6(.x(A[1]), .y(B[1]), .pp(p11));
    partial_product P7(.x(A[2]), .y(B[1]), .pp(p21));
    not_partial_product P8(.x(A[3]), .y(B[1]), .pp(p31));
   
    partial_product P9(.x(A[0]), .y(B[2]), .pp(p02));
    partial_product P10(.x(A[1]), .y(B[2]), .pp(p12));
    partial_product P11(.x(A[2]), .y(B[2]), .pp(p22));
    not_partial_product P12(.x(A[3]), .y(B[2]), .pp(p32));
   
    not_partial_product P13(.x(A[0]), .y(B[3]), .pp(p03));
    not_partial_product P14(.x(A[1]), .y(B[3]), .pp(p13));
    not_partial_product P15(.x(A[2]), .y(B[3]), .pp(p23));
    partial_product P16(.x(A[3]), .y(B[3]), .pp(p33));
       
    wire c[14:0];
    wire s[7:0];
   
    assign Out[0] = p00;
   
    half_adder H1(.x(p10), .y(p01), .sum(Out[1]), .carry(c[0]));
    full_adder F1(.x(p20), .y(p11), .cin(p02), .sum(s[0]), .carry(c[1]));
    full_adder F2(.x(p03), .y(p21), .cin(p12), .sum(s[1]), .carry(c[2]));
    full_adder F3(.x(p22), .y(p13), .cin(1'b1), .sum(s[2]), .carry(c[3]));
    half_adder H2(.x(p32), .y(p23), .sum(s[3]), .carry(c[4]));
   
    half_adder H3(.x(c[0]), .y(s[0]), .sum(Out[2]), .carry(c[5]));
    full_adder F4(.x(c[1]), .y(p30), .cin(s[1]), .sum(s[4]), .carry(c[6]));
    full_adder F5(.x(c[2]), .y(p31), .cin(s[2]), .sum(s[5]), .carry(c[7]));
    half_adder H4(.x(c[3]), .y(s[3]), .sum(s[6]), .carry(c[8]));
    half_adder H5(.x(c[4]), .y(p33), .sum(s[7]), .carry(c[9]));
   
    half_adder H6(.x(c[5]), .y(s[4]), .sum(Out[3]), .carry(c[10]));
   
    full_adder F6(.x(c[10]), .y(c[6]), .cin(s[5]), .sum(Out[4]), .carry(c[11]));
   
    full_adder F7(.x(c[11]), .y(c[7]), .cin(s[6]), .sum(Out[5]), .carry(c[12]));
   
    full_adder F8(.x(c[12]), .y(c[8]), .cin(s[7]), .sum(Out[6]), .carry(c[13]));
   
    full_adder F9(.x(c[13]), .y(c[9]), .cin(1'b1), .sum(Out[7]), .carry(c[14]));
   
    assign Out[8] = ~c[14];
endmodule
