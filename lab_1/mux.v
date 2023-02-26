`timescale 1ns / 1ps

module multiplexer_4to1(
        output o,
        input i0,
        input i1,
        input i2,
        input i3,
        input s1,
        input s0
    );
    wire s1n, s0n, y0, y1, y2, y3;
    
    not (s1n, s1);
    not (s0n, s0);
    
    and (y0, i0, s1n, s0n);
    and (y1, i1, s1n, s0);
    and (y2, i2, s1, s0n);
    and (y3, i3, s1, s0);
    
    or (o, y0, y1, y2, y3);
endmodule
