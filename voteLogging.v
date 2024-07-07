`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 21:04:58
// Design Name: 
// Module Name: vote_logging
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vote_logging(
   input clock,
    input reset,
    input mode,
    input candidate1,
      input candidate2,
      input candidate3,
      input candidate4,
       output reg [3:0]  candidate1_recieved,
     output    reg [3:0]  candidate2_recieved,
      output  reg [3:0]  candidate3_recieved,
      output    reg [3:0]  candidate4_recieved
);
   always @(posedge clock)
    begin
    if(reset)
    begin
    candidate1_recieved<=0;
    candidate2_recieved<=0;
    candidate3_recieved<=0;
    candidate4_recieved<=0;
   end
   else
   begin
   if(candidate1 & mode==0)
   candidate1_recieved <=   candidate1_recieved+1;
  else  if(candidate2 & mode==0)
   candidate2_recieved <=   candidate2_recieved+1;
   else  if(candidate3 & mode==0)
   candidate3_recieved <=   candidate3_recieved+1;
 else if(candidate4 & mode==0)
   candidate4_recieved <=   candidate4_recieved+1;

   end
    end
endmodule
