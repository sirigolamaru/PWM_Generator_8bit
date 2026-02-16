# PWM_Generator_8bit

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

## Conclusion:
The 8-bit PWM generator successfully produces a PWM signal with variable duty cycle.

Duty cycle can be precisely controlled from 0% to 100% using an 8-bit input.

This design can be used in DC motor speed control, LED dimming, and signal modulation applications.

FPGA implementation demonstrates flexibility and real-time control of PWM signals.
