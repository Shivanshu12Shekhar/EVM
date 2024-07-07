`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 21:02:53
// Design Name: 
// Module Name: buttoncontrol
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

module buttoncontrol(
input clock,
input reset,
input button,
output reg valid_vote
);
reg [22:0] counter;
always @(posedge clock)
begin 
if(reset)
counter<=0;
else
begin 
   if(button & counter < 11)
    counter<=counter+1;
else if(!button)
counter<=0;
   end
end

always@(posedge clock)
begin
if(reset)
valid_vote<=1'b0;
else
  begin
       if(counter==10)
       
       valid_vote=1'b1;
       else 
       valid_vote=1'b0;
   end
end
        
endmodule
