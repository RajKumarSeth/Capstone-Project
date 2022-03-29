`timescale 1ns / 1ps

// prevents undeclared wires from being inferred
`default_nettype none

`ifndef INPUT
`define INPUT "twiddle.txt"
`endif

module try;
   reg [15:0] i_real;
   reg [15:0] i_imag;
   // status variables (number of errors and total number of tests)
   integer     input_file;
   
   initial begin
   // open the twiddle.txt test input file
      input_file = $fopen(`INPUT, "r");
      if (input_file == `NULL) begin
         $display("Error opening file: ", `INPUT);
         $finish;
      end
      // wait for global reset to finish
      #100;

      #2;
     //reading a single line from the input file
      while (2 == $fscanf(input_file, "%d %d", i_real, i_imag)) begin    
         #8; // wait for the divider to do its thing
	 $display(" the values are %d and %d", i_real, i_imag);
      end//end while
   end//end initial
endmodule