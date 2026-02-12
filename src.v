 `timescale 1ns / 1ps
module pwm_generator_8bit (
    input clk,           // system clock
    input reset,         // active-high reset
    input [7:0] duty,    // duty cycle (0 to 255)
    output reg pwm_out   // pwm output
);

reg [7:0] counter;       // 8-bit counter

always @(posedge clk or posedge reset) begin
    if (reset)
        counter <= 8'd0;
    else
        counter <= counter + 1;
end

// PWM logic
always @(posedge clk or posedge reset) begin
    if (reset)
        pwm_out <= 0;
    else if (counter < duty)
        pwm_out <= 1;       // high time
    else
        pwm_out <= 0;       // low time
end

endmodule
