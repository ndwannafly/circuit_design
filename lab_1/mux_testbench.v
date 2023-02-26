`timescale 1ns / 1ps

module multiplexer_test_bench;
    reg i0_in, i1_in, i2_in, i3_in;
    reg s1_in, s0_in;
    wire out;
    
    multiplexer_4to1 multiplexer(
        .o(out),
        .i0(i0_in),
        .i1(i1_in),
        .i2(i2_in),
        .i3(i3_in),
        .s1(s1_in),
        .s0(s0_in)
    );
    
    integer i;
    integer j;
    reg [4:0] test_val_i;
    reg [2:0] test_val_s;
    
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            test_val_i = i;
            i0_in = test_val_i[0];
            i1_in = test_val_i[1];
            i2_in = test_val_i[2];
            i3_in = test_val_i[3];
            for (j = 0; j < 4; j = j + 1) begin
                test_val_s = j;
                s1_in = test_val_s[0];
                s0_in = test_val_s[1];
                $display("i0=%b, i1=%b, i2=%b, i3=%b, s1=%b, s0=%b, out=%b", i0_in, i1_in, i2_in, i3_in, s1_in, s0_in, out);
                #10
                if ((s1_in==0 && s0_in==0 && out==i0_in) || 
                    (s1_in==0 && s0_in==1 && out==i1_in) ||
                    (s1_in==1 && s0_in==0 && out==i2_in) ||
                    (s1_in==1 && s0_in==1 && out==i3_in)) begin
                    $display("The multiplexer output is correct!!!");
                end else begin
                    $display("The multiplexer output is wrong!!!");
                end
            end
        end
        
        #10 $stop;
    end
    
    
endmodule
