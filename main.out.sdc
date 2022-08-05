## Generated SDC file "main.out.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

## DATE    "Mon Jul 25 19:00:43 2022"

##
## DEVICE  "EP4CE22F17C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_in} -period 20.000 -waveform { 0.000 0.500 } [get_ports { clk_in }]
create_clock -name {out_clk_positive~reg0} -period 20.000 -waveform { 0.000 0.500 } [get_registers { out_clk_positive~reg0 }]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk_in}] -rise_to [get_clocks {clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_in}] -fall_to [get_clocks {clk_in}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk_in}] -rise_to [get_clocks {out_clk_positive~reg0}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk_in}] -fall_to [get_clocks {out_clk_positive~reg0}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_in}] -rise_to [get_clocks {clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_in}] -fall_to [get_clocks {clk_in}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk_in}] -rise_to [get_clocks {out_clk_positive~reg0}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk_in}] -fall_to [get_clocks {out_clk_positive~reg0}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {out_clk_positive~reg0}] -rise_to [get_clocks {clk_in}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {out_clk_positive~reg0}] -fall_to [get_clocks {clk_in}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {out_clk_positive~reg0}] -rise_to [get_clocks {out_clk_positive~reg0}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {out_clk_positive~reg0}] -fall_to [get_clocks {out_clk_positive~reg0}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {out_clk_positive~reg0}] -rise_to [get_clocks {clk_in}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {out_clk_positive~reg0}] -fall_to [get_clocks {clk_in}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {out_clk_positive~reg0}] -rise_to [get_clocks {out_clk_positive~reg0}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {out_clk_positive~reg0}] -fall_to [get_clocks {out_clk_positive~reg0}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

