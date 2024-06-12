module ibm1620_core_test1;

    //wire a = 1'bz;
    //wire b = 1'bz;
    wire c;
    wire d;
    //wire e = 1'bz;
    //wire f = 1'bz;
    //wire g = 1'bz;
    //wire h = 1'bz;
    //wire gnd = 1'bx;
    //wire k = 1'bz;
    //wire l = 1'bz;
    //wire vn12 = 1'bx;
    //wire vp12 = 1'bx;
    //wire p = 1'bz;
    //wire q = 1'bz;
    //wire r = 1'bz;

    IBM_SMS_TAF C_B1A15(
        .c(c),
        .d(c)
    );

    wire j0, j1;

    IBM_SMS_TAJ C_B1A16(
        .q(c),
        .d(c),
        .c(1'bz),
        .r(j0),
        .p(j0),
        .b(j1),
        .a(j1)
    );

    initial begin 

        $monitor("MON: [%0t] clk: %0d p: %0d, b: %0d", 
            $time, c, j0, j1);

        #10 $stop;

    end 


endmodule;
