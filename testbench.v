`timescale 1ns / 1ps

module testbench;
reg clock;
reg reset;
reg mode;
reg candidate1_button;
reg  candidate2_button;
reg candidate3_button;
reg candidate4_button;


wire [3:0]result;

 evm uut(.clock(clock),.reset(reset),.mode(mode),.candidate1_button(candidate1_button),.candidate2_button(candidate2_button),.candidate3_button(candidate3_button),.candidate4_button(candidate4_button),.result(result));
  initial begin
        clock = 0;
        forever#5 clock=~clock;
        end
      initial begin 
      reset=1;mode=0;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0;#10;
      reset=0;mode=0;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0;#5
      reset=0;mode=0;candidate1_button=1;candidate2_button=0;candidate3_button=0;candidate4_button=0;#10
         reset=0;mode=0;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0;#5 
    reset=0;mode=0;candidate1_button=1;candidate2_button=0;candidate3_button=0;candidate4_button=0;    #150 
    reset=0;mode=0;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0; #5   
    reset=0;mode=0;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0; #10    
   
     
reset=0;mode=0;candidate1_button=0;candidate2_button=1;candidate3_button=0;candidate4_button=0;    #150 
reset=0;mode=0;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0;#15
reset=0;mode=0;candidate1_button=1;candidate2_button=0;candidate3_button=0;candidate4_button=0;#150
 
    reset=0;mode=0;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0; #20  
    reset=0;mode=1;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0;    #15  
reset=0;mode=1;candidate1_button=1;candidate2_button=0;candidate3_button=0;candidate4_button=0;#150
    reset=0;mode=1;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0;    #15  
reset=0;mode=1;candidate1_button=0;candidate2_button=1;candidate3_button=0;candidate4_button=0;#150
    reset=0;mode=1;candidate1_button=0;candidate2_button=0;candidate3_button=0;candidate4_button=0;    #15  
 reset=0;mode=1;candidate1_button=0;candidate2_button=0;candidate3_button=1;candidate4_button=0;#150


     $finish;
      end
     
  
   
endmodule
