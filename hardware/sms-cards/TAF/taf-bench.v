module test1;

    wire a = 1'bz;
    wire b = 1'bz;
    wire c;
    wire d;
    wire e = 1'bz;
    wire f = 1'bz;
    wire g = 1'bz;
    wire h = 1'bz;
    wire gnd = 1'bx;
    wire k = 1'bz;
    wire l = 1'bz;
    wire vn12 = 1'bx;
    wire vp12 = 1'bx;
    wire p = 1'bz;
    wire q = 1'bz;
    wire r = 1'bz;

    IBM_SMS_TAF C_B1A15(
        .c(c),
        .d(d)
    );

    initial begin 

        $monitor("MON: 0: [%0t] clk: %0d", 
            $time, c);

        #50 $stop;

    end 


endmodule;
