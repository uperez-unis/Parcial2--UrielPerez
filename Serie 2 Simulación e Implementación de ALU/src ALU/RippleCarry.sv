`timescale 100ns / 1ps

module RippleCarry(
    input logic [9:0] a, b,
    input logic cin,
    output logic [9:0] s,
    output logic cout
   
    );
    
    logic [9:0] c_internal;
    
    FULLADDER add0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .s(s[0]),
        .cout(c_internal[0])
        );
    FULLADDER add1(
        .a(a[1]),
        .b(b[1]),
        .cin(c_internal[0]),
        .s(s[1]),
        .cout(c_internal[1])
        );
        
    FULLADDER add2(
        .a(a[2]),
        .b(b[2]),
        .cin(c_internal[1]),
        .s(s[2]),
        .cout(c_internal[2])
        );
        
    FULLADDER add3(
        .a(a[3]),
        .b(b[3]),
        .cin(c_internal[2]),
        .s(s[3]),
        .cout(c_internal[3])
        );

    FULLADDER add4(
        .a(a[4]),
        .b(b[4]),
        .cin(c_internal[3]),
        .s(s[4]),
        .cout(c_internal[4])
        );    

    FULLADDER add5(
        .a(a[5]),
        .b(b[5]),
        .cin(c_internal[4]),
        .s(s[5]),
        .cout(c_internal[5])
        );  

    FULLADDER add6(
        .a(a[6]),
        .b(b[6]),
        .cin(c_internal[5]),
        .s(s[6]),
        .cout(c_internal[6])
        );   
        
    FULLADDER add7(
        .a(a[7]),
        .b(b[7]),
        .cin(c_internal[6]),
        .s(s[7]),
        .cout(c_internal[7])
        );   

    FULLADDER add8(
        .a(a[8]),
        .b(b[8]),
        .cin(c_internal[7]),
        .s(s[8]),
        .cout(c_internal[8])
        );
        
    FULLADDER add9(
        .a(a[9]),
        .b(b[9]),
        .cin(c_internal[8]),
        .s(s[9]),
        .cout(cout)
        );        
        
            
    
endmodule
