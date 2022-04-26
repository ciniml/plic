set project_name plic
set vendor_name vendor
set library_name VexRiscv
set taxonomy /Network
set display_name "AHB3LITE PLIC"
set supported_families "*"
set core_version 1.0
set core_revision 1

set rtl_dir ../../rtl/verilog

create_project $project_name.xpr -in_memory
set device_part "xc7z010clg400-1"
set_property part $device_part [current_project]

# Add target files
# Create 'sources_1' fileset
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}
# Create 'constrs_1' fileset
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -srcset constrs_1
}
# Create 'sim_1' fileset
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -srcset sim_1
}

# Define source file list

set source_files {}
lappend source_files $rtl_dir/core/plic_cell.sv
lappend source_files $rtl_dir/core/plic_core.sv
lappend source_files $rtl_dir/core/plic_dynamic_registers.sv
lappend source_files $rtl_dir/core/plic_gateway.sv
lappend source_files $rtl_dir/core/plic_priority_index.sv
lappend source_files $rtl_dir/core/plic_target.sv
lappend source_files $rtl_dir/ahb3lite/ahb3lite_plic_top.sv

set constraint_files {}

# Add source files to filesets
foreach source_file $source_files {
  set name [file tail $source_file]
  add_file -fileset [get_filesets sources_1] $source_file
}
# foreach constraint_file $constraint_files {
#   add_file -fileset [get_filesets constrs_1] $constraint_file
# }

# Package IP.
ipx::package_project -root_dir . -vendor $vendor_name -library $library_name -taxonomy $taxonomy -force
set ipcore [ipx::current_core]

## Helper interface generator functions
proc add_clock_if { name direction associated_busif } {
  set bus_if [ipx::add_bus_interface $name [ipx::current_core]]
  set_property ABSTRACTION_TYPE_VLNV xilinx.com:signal:clock_rtl:1.0 $bus_if
  set_property BUS_TYPE_VLNV xilinx.com:signal:clock:1.0 $bus_if
  set_property INTERFACE_MODE $direction $bus_if
  ipx::add_port_map CLK $bus_if
  set_property physical_name $name [ipx::get_port_maps CLK -of_objects $bus_if]
  # ipx::add_bus_parameter FREQ_HZ $bus_if
  # set_property VALUE $freq_hz [ipx::get_bus_parameters FREQ_HZ -of_objects $bus_if]
  if { [string length $associated_busif] ne 0 } {
    ipx::add_bus_parameter ASSOCIATED_BUSIF $bus_if
    set_property VALUE $associated_busif [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects $bus_if]
  }
}
proc add_reset_if { name direction polarity } {
  set bus_if [ipx::add_bus_interface $name [ipx::current_core]]
  set_property ABSTRACTION_TYPE_VLNV xilinx.com:signal:reset_rtl:1.0 $bus_if
  set_property BUS_TYPE_VLNV xilinx.com:signal:reset:1.0 $bus_if
  set_property INTERFACE_MODE $direction $bus_if
  ipx::add_port_map RST $bus_if
  set_property PHYSICAL_NAME $name [ipx::get_port_maps RST -of_objects $bus_if]
  ipx::add_bus_parameter POLARITY $bus_if
  set_property VALUE $polarity [ipx::get_bus_parameters POLARITY -of_objects $bus_if]
}

set s_ahb_bus_if [ipx::add_bus_interface S_AHB [ipx::current_core]]
set_property ABSTRACTION_TYPE_VLNV xilinx.com:interface:ahblite_rtl:2.0 $s_ahb_bus_if
set_property BUS_TYPE_VLNV xilinx.com:interface:ahblite:2.0 $s_ahb_bus_if
set_property INTERFACE_MODE slave $s_ahb_bus_if
set_property PHYSICAL_NAME HSEL      [ipx::add_port_map HSEL      $s_ahb_bus_if]
set_property PHYSICAL_NAME HADDR     [ipx::add_port_map HADDR     $s_ahb_bus_if]
set_property PHYSICAL_NAME HWDATA    [ipx::add_port_map HWDATA    $s_ahb_bus_if]
set_property PHYSICAL_NAME HRDATA    [ipx::add_port_map HRDATA    $s_ahb_bus_if]
set_property PHYSICAL_NAME HWRITE    [ipx::add_port_map HWRITE    $s_ahb_bus_if]
set_property PHYSICAL_NAME HSIZE     [ipx::add_port_map HSIZE     $s_ahb_bus_if]
set_property PHYSICAL_NAME HBURST    [ipx::add_port_map HBURST    $s_ahb_bus_if]
set_property PHYSICAL_NAME HPROT     [ipx::add_port_map HPROT     $s_ahb_bus_if]
set_property PHYSICAL_NAME HTRANS    [ipx::add_port_map HTRANS    $s_ahb_bus_if]
set_property PHYSICAL_NAME HREADYOUT [ipx::add_port_map HREADYOUT $s_ahb_bus_if]
set_property PHYSICAL_NAME HREADY    [ipx::add_port_map HREADY    $s_ahb_bus_if]
set_property PHYSICAL_NAME HRESP     [ipx::add_port_map HRESP     $s_ahb_bus_if]

add_clock_if HCLK slave {S_APB:HRESETn}
add_reset_if HRESETn slave ACTIVE_LOW

# Remove unnecessary interface
ipx::remove_bus_interface irq [ipx::current_core]

# Set basic properties.
set_property NAME $project_name $ipcore
set_property DISPLAY_NAME $display_name $ipcore
set_property SUPPORTED_FAMILIES $supported_families $ipcore
set_property VERSION $core_version $ipcore
set_property CORE_REVISION $core_revision $ipcore

### Add clock interfaces
## master
#add_clock_if tx_clock slave 25000000 {tx_xgmii:tx_saxis:tx_saxis_bypass}
#add_clock_if rx_clock slave 25000000 {rx_xgmii:rx_maxis}

### Add reset interfaces
# tx_reset
#add_reset_if tx_reset slave ACTIVE_HIGH
# rx_reset
#add_reset_if rx_reset slave ACTIVE_HIGH

# Generate other files and save IP core.
ipx::create_xgui_files $ipcore
ipx::update_checksums $ipcore
ipx::save_core $ipcore

# Finalize project
close_project
