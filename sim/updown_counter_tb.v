module tb_counter;
    reg Clk;
    reg reset;
    reg UpOrDown;
    wire [2:0] Count;
    updown_counter uut (.clk(Clk),.reset(reset),.UpOrDown(UpOrDown),.count(Count));
    initial Clk = 0;
    always #10 Clk = ~Clk;
    
    initial begin
        // Apply Inputs
        reset = 0;
        UpOrDown = 0;
        #300;
        UpOrDown = 1;
      #300;
        reset = 1;
        UpOrDown = 0;
        #100;
        reset = 0;  
    end
      
endmodule
