// SMS Card: TAJ - SDTRL - TRIGGER BINARY
// IBM 1620 Logic Reproduction Project
// Bruce MacKinnon 12-June
//
// ========================================================================
// IMPORTANT
// 
// Pin G is not implemented!

module  IBM_SMS_TAJ(
    input a,
    input c,
    input d,
    input e,
    input f,
    input h,
    input k,
    input l,
    input q,
    input r,
    output b, 
    output p
    );

    wire ac_set_left_0, gate_left_0, ac_set_right_0, gate_right_0;
    wire ac_set_left_1, gate_left_1, ac_set_right_1, gate_right_1;
    wire reset_left, reset_right;
    reg state;

    assign gate_left_0 = a;
    assign b = state;
    assign reset_right = c;
    assign ac_set_left_0 = d;
    assign gate_left_1 = e;
    assign ac_set_left_1 = f;
    assign reset_left = h;
    assign gate_right_1 = k;
    assign ac_set_right_1 = l;
    assign p = !state;
    assign ac_set_right_0 = q;
    assign gate_right_0 = r;

    always @(posedge ac_set_left_0) begin
        if (gate_left_0 == 1 & state == 1) begin
            state <= 0;
        end
    end
    always @(posedge ac_set_right_0) begin
        if (gate_right_0 == 1 & state == 0) begin
            state <= 1;
        end
    end

    always @(posedge reset_left) begin
        state <= 1;
    end
    always @(negedge reset_left) begin
        state <= 0;
    end
    always @(posedge reset_right) begin
        state <= 0;
    end
    always @(negedge reset_right) begin
        state <= 1;
    end

    initial begin 

        state <= 1;
        /*
        reset_left = 1'bz;
        reset_right = 1'bz;

        #1
        // Won't do anything, gate isn't opened
        ac_set_left_0 = 1;
        ac_set_left_0 = 0;
        $display("Step 1: 0: [%0t] b: %0d p: %0d", $time, b, p);
        #1
        // Won't do anything, need rising edge of AC set
        gate_left_0 = 1;
        gate_left_0 = 0;
        $display("Step 2: 0: [%0t] b: %0d p: %0d", $time, b, p);
        #1
        // Open gate
        gate_left_0 = 1;
        // Generate a left pulse
        ac_set_left_0 = 1;
        ac_set_left_0 = 0;
        #1
        // Now we'll see the change
        $display("Step 3: 0: [%0t] b: %0d p: %0d", $time, b, p);
        #1
        // Generate a right pulse
        ac_set_right_0 = 1;
        ac_set_right_0 = 0;
        #1
        // No change
        $display("Step 4: 0: [%0t] b: %0d p: %0d", $time, b, p);
        // Open gate
        gate_right_0 = 1;
        // Generate a right pulse
        ac_set_right_0 = 1;
        ac_set_right_0 = 0;
        #1
        // Change
        $display("Step 5: 0: [%0t] b: %0d p: %0d", $time, b, p);
        #1
        // Test reset
        reset_right = 0;
        reset_right = 1'bz;
        #1
        // Change
        $display("Step 6: 0: [%0t] b: %0d p: %0d", $time, b, p);

        #20 $stop;
        */
    end 

endmodule;
