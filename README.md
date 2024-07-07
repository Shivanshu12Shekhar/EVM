# EVM
EVM modelling using Verilog

buttonControl.v => Checks if vote casted is valid or not.
voteLogging.v => Counts number of valid votes casted.
modeControl.v => Toggles between voting & counting mode. Also, defines the role of input buttons in both of the modes.
emv.v => Top-Level module where all the above mentioned modules are instantiated.
testbench.v => It is only for the purpose of simulation.
electronic_voting_machine.xpr => Vivado file.

PYNQ-Z2 v1.0.xdc is used as constraint file for implementation on PYNQ-Z2 board as shown in evm demo.mp4
