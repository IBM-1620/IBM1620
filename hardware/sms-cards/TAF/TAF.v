// SMS Card: TAF - OSCILLATOR, ONE MC
// IBM 1620 Logic Reproduction Project
// Bruce MacKinnon 12-June
//
// ========================================================================
// IMPORTANT
// 
// In the original circuit pin C provides a 360 ohm pull to ground. Usually
// this is tied to pin D, but that isn't mandatory. This simulation makes
// the assumption that C and D are tied together.
//
// We may need to revisit this.

module  IBM_SMS_TAF(
    output c, 
    output d
    );

    reg clk = 0;
    assign d = clk;
    assign c = clk;
    
    // Constant clock
    always begin 
        #1 clk = 1; 
        #1 clk = 0;
    end

endmodule
