## Clock Signal (100 MHz on Nexys A7)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## 7-Segment Display Segment Pins (CA to CG)
set_property PACKAGE_PIN T10 [get_ports {seg[0]}]  ## a
set_property PACKAGE_PIN R10 [get_ports {seg[1]}]  ## b
set_property PACKAGE_PIN K16 [get_ports {seg[2]}]  ## c
set_property PACKAGE_PIN K13 [get_ports {seg[3]}]  ## d
set_property PACKAGE_PIN P15 [get_ports {seg[4]}]  ## e
set_property PACKAGE_PIN T11 [get_ports {seg[5]}]  ## f
set_property PACKAGE_PIN L18 [get_ports {seg[6]}]  ## g
set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]

## Decimal Point
set_property PACKAGE_PIN H15 [get_ports dp]
set_property IOSTANDARD LVCMOS33 [get_ports dp]

## Anode Signals (AN0 to AN3)
set_property PACKAGE_PIN J17 [get_ports {an[0]}]
set_property PACKAGE_PIN J18 [get_ports {an[1]}]
set_property PACKAGE_PIN T9  [get_ports {an[2]}]
set_property PACKAGE_PIN J14 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[*]}]
