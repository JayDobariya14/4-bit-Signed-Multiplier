`timescale 1ns / 1ps

module tb_0(

    );
    
    reg [3:0] t_a;
    reg [3:0] t_b;
    wire [8:0] OUT;
    
    bit4_signed_multiplier dut(.A(t_a),.B(t_b),.Out(OUT));
    
    initial begin
    
    t_a = 4'b0000; t_b = 4'b1111; // all zeroes and all ones
    #10
    
    t_a = 4'b1010; t_b = 4'b1101; // both negative (-6 * -3)
    #10
    
    t_a = 4'b0111; t_b = 4'b1000; // positive and negative (7 * -8) (max negative answer)
    #10
    
    t_a = 4'b1000; t_b = 4'b0111; // negative and positive (-8 * 7) (max negative answer)
    #10
    
    t_a = 4'b1000; t_b = 4'b1000; // (-8 * -8) (max positive answer)
    #10
    
    t_a = 4'b0011; t_b = 4'b0110; // both positive (3 * 6)
    #10
    
    $stop;
    
    end
    
endmodule
