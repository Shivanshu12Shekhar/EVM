`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 21:08:03
// Design Name: 
// Module Name: mode_control
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

module mode_control(
   input clock,
    input reset,
    input mode,
    input valid_vote_casted,
    input [3:0] candidate1_votes,
      input [3:0] candidate2_votes,
        input [3:0] candidate3_votes,
          input [3:0] candidate4_votes,

       input candidate1_button_press,
       input candidate2_button_press,
       input candidate3_button_press,
       input candidate4_button_press,

       output reg [3:0]result
);
reg [22:0] counter; 
always @(posedge clock)
begin
if(reset)
counter<=0;
else if (valid_vote_casted)
begin
counter<=counter+1;

end
else if(counter!=0 &counter<10)
begin
counter<=counter+1;

end
else 
counter<=0;
end

always @(posedge clock)
begin

if(reset)
result<=0;
else 
begin

if(mode==0 & counter > 0)
begin

result<=4'b1111;
end
else if(mode==0)
result<=4'b0000;
else if(mode==1)
$display("hello %b",candidate1_button_press);
begin 
if(candidate1_button_press)
begin
$display("hi %b",candidate1_votes);
result<=candidate1_votes;
end
 else if(candidate2_button_press)
result<=candidate2_votes;
 else if(candidate3_button_press)
result<=candidate3_votes;
 else if(candidate4_button_press)
result<=candidate4_votes;

end
end
end
endmodule
