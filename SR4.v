`timescale 1ns / 1ps
//After 4 clock cycles, Dout has the data from the serial in.
//Loads from MSB to LSB --->
//Serial In Parallel Out (SIPO)

//module(outputs, inputs);
//outputs
//...
//inputs
//..
//registers
//assignments
//..

module SR4(Dout, Din,  clk, rst_n );
    //Output for system
    output [3:0] Dout;
    //input for system
    input Din;
    input clk, rst_n;

reg [3:0] Dout;

initial begin
Dout = 4'b0000;
end

always @ (posedge clk or negedge rst_n)
begin
    if (!rst_n)
        Dout <= 4'b0000;
    else
        Dout <= {Din, Dout[3:1]};
end

endmodule
