`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 21:21:36
// Design Name: 
// Module Name: evm
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

module evm(
  input clock,
    input reset,
    input mode,
       input candidate1_button,
       input candidate2_button,
       input candidate3_button,
       input candidate4_button,
       output [3:0]result

       
);
wire anyValid_vote;
wire valid_vote1;
wire valid_vote2;
wire valid_vote3;
wire valid_vote4;

wire [3:0] candidate1_vote_recieved;
wire [3:0] candidate2_vote_recieved;
wire  [3:0] candidate3_vote_recieved;
wire  [3:0] candidate4_vote_recieved;

assign anyValid_vote=valid_vote1|valid_vote2|valid_vote3|valid_vote4;
buttoncontrol bc1(
.clock(clock),
.reset(reset),
.button(candidate1_button),
.valid_vote(valid_vote1));
buttoncontrol bc2(
.clock(clock),
.reset(reset),
.button(candidate2_button),
.valid_vote(valid_vote2));
buttoncontrol bc3(
.clock(clock),
.reset(reset),
.button(candidate3_button),
.valid_vote(valid_vote3));
buttoncontrol bc4(
.clock(clock),
.reset(reset),
.button(candidate4_button),
.valid_vote(valid_vote4));


vote_logging vl(
.clock(clock),
.reset(reset),
.mode(mode),
 .candidate1(valid_vote1),
 .candidate2(valid_vote2),
 .candidate3(valid_vote3),
 .candidate4(valid_vote4),
        .candidate1_recieved(candidate1_vote_recieved),
        .candidate2_recieved(candidate2_vote_recieved),
        .candidate3_recieved(candidate3_vote_recieved),
        .candidate4_recieved(candidate4_vote_recieved)

);
     


mode_control Mc(
 .clock(clock),
    .reset(reset),
     .mode(mode),
   .valid_vote_casted(anyValid_vote),
   .candidate1_votes(candidate1_vote_recieved),
   .candidate2_votes(candidate2_vote_recieved),
   .candidate3_votes(candidate3_vote_recieved),
   .candidate4_votes(candidate4_vote_recieved),
      .candidate1_button_press(valid_vote1),
      .candidate2_button_press(valid_vote2),
      .candidate3_button_press(valid_vote3),
      .candidate4_button_press(valid_vote4),

      .result(result)
                        
);


endmodule
