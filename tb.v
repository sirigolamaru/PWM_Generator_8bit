`timescale 1ns / 1ps

module tb;

reg clk;
reg reset;
reg [7:0] duty;
wire pwm_out;

// Instantiate PWM module
pwm_generator_8bit dut (
    .clk(clk),
    .reset(reset),
    .duty(duty),
    .pwm_out(pwm_out)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;  // 10ns period clock

// Test stimulus
initial begin
    reset = 1;
    duty = 8'd0;
    #20;
    reset = 0;

    // Test duty cycle changes
    duty = 8'd64;   // 25% duty cycle
    #500;

    duty = 8'd128;  // 50% duty cycle
    #500;

    duty = 8'd192;  // 75% duty cycle
    #500;

    duty = 8'd255;  // 100% duty cycle
    #500;

    duty = 8'd0;    // 0% duty cycle
    #500;

    $stop;
end

endmodule
