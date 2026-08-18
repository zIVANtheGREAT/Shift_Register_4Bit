`timescale 1ns / 1ps

module SR4TB;
    //output
    wire [3:0] Dout;
    //inputs
    reg Din, clk, rst_n;

SR4 UUT(
        .Dout(Dout),
        .Din(Din),
        .clk(clk),
        .rst_n(rst_n)
);

initial begin
    //Initalize inputs
    Din = 1'b0;
    clk =   1'b0;
    rst_n = 1'b0;
    #10
    rst_n = 1'b1;
    #15
    //Load in C (1100)
    Din = 1'b0; #50
    Din = 1'b0; #50
    Din = 1'b1; #50
    Din = 1'b1; #50
    
    rst_n = 1'b0;
    #450
    rst_n = 1'b1;

    //Load in A
    Din = 1'b0; #50 
    Din = 1'b1; #50 
    Din = 1'b0; #50 
    Din = 1'b1; #50
    
    rst_n = 1'b0;
    #450
    rst_n = 1'b1;
 
    //Load in 6
    Din = 1'b0; #50 
    Din = 1'b1; #50 
    Din = 1'b1; #50 
    Din = 1'b0; #50
    
    rst_n = 1'b0;
    #450
    rst_n = 1'b1;
 
    //Load in 9
    Din = 1'b1; #50 
    Din = 1'b0; #50 
    Din = 1'b0; #50 
    Din = 1'b1; #50;
    rst_n = 1'b0;
end

always #25 clk <= ~clk;
endmodule
