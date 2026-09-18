
set_property PACKAGE_PIN <CLOCK_PIN> [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk [get_ports clk]

set_property PACKAGE_PIN <RESET_PIN> [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN <D_PIN> [get_ports d]
set_property IOSTANDARD LVCMOS33 [get_ports d]

set_property PACKAGE_PIN <Q_PIN> [get_ports q]
set_property IOSTANDARD LVCMOS33 [get_ports q]