# PWM_Generator_8bit
## Aim:

To design and implement an 8-bit Pulse Width Modulation (PWM) generator that can generate a PWM signal with variable duty cycle ranging from 0% to 100%, using digital logic/FPGA.

## Apparatus / Tools Required:

FPGA Board (e.g., Xilinx Spartan-3/7, Nexys A7)

Verilog / VHDL HDL software (Vivado / Quartus)

Power supply for FPGA board

Oscilloscope or LED for PWM signal observation

Computer with simulation tools

## Procedure:

Design Phase:

Write an 8-bit counter that counts from 0 to 255 continuously.

Compare the counter value with an 8-bit input duty cycle value.

Output HIGH if counter < duty cycle, else output LOW.

Simulation Phase:

Simulate the design using ModelSim or Vivado Simulator.

Apply different duty cycle values (e.g., 50%, 75%, 25%) and observe PWM waveform.

Implementation Phase:

Synthesize the design and program it onto the FPGA board.

Connect output to an LED or oscilloscope.

Vary the duty cycle input and observe changes in brightness or PWM waveform.

## Verilog Code for PWM Generator 8 Bit

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

## RTL Diagram:
<img width="1366" height="768" alt="Screenshot (79)" src="https://github.com/user-attachments/assets/b1d6133a-2de6-42f7-b4c5-a6da691dfc20" />

## Testbench For PWM Generator 8 Bit

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

## Output Waveform:
<img width="1366" height="768" alt="Screenshot (82)" src="https://github.com/user-attachments/assets/b67d8d79-798e-4817-a30e-d1101cdb0e39" />

## Conclsion:
The 8-bit PWM generator successfully produces a PWM signal with variable duty cycle.

Duty cycle can be precisely controlled from 0% to 100% using an 8-bit input.

This design can be used in DC motor speed control, LED dimming, and signal modulation applications.

FPGA implementation demonstrates flexibility and real-time control of PWM signals.
