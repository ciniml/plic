# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "HADDR_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_CONFIG_REG" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_THRESHOLD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HDATA_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_PENDING_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PRIORITIES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SOURCES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TARGETS" -parent ${Page_0}


}

proc update_PARAM_VALUE.HADDR_SIZE { PARAM_VALUE.HADDR_SIZE } {
	# Procedure called to update HADDR_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HADDR_SIZE { PARAM_VALUE.HADDR_SIZE } {
	# Procedure called to validate HADDR_SIZE
	return true
}

proc update_PARAM_VALUE.HAS_CONFIG_REG { PARAM_VALUE.HAS_CONFIG_REG } {
	# Procedure called to update HAS_CONFIG_REG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_CONFIG_REG { PARAM_VALUE.HAS_CONFIG_REG } {
	# Procedure called to validate HAS_CONFIG_REG
	return true
}

proc update_PARAM_VALUE.HAS_THRESHOLD { PARAM_VALUE.HAS_THRESHOLD } {
	# Procedure called to update HAS_THRESHOLD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_THRESHOLD { PARAM_VALUE.HAS_THRESHOLD } {
	# Procedure called to validate HAS_THRESHOLD
	return true
}

proc update_PARAM_VALUE.HDATA_SIZE { PARAM_VALUE.HDATA_SIZE } {
	# Procedure called to update HDATA_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HDATA_SIZE { PARAM_VALUE.HDATA_SIZE } {
	# Procedure called to validate HDATA_SIZE
	return true
}

proc update_PARAM_VALUE.MAX_PENDING_COUNT { PARAM_VALUE.MAX_PENDING_COUNT } {
	# Procedure called to update MAX_PENDING_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_PENDING_COUNT { PARAM_VALUE.MAX_PENDING_COUNT } {
	# Procedure called to validate MAX_PENDING_COUNT
	return true
}

proc update_PARAM_VALUE.PRIORITIES { PARAM_VALUE.PRIORITIES } {
	# Procedure called to update PRIORITIES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PRIORITIES { PARAM_VALUE.PRIORITIES } {
	# Procedure called to validate PRIORITIES
	return true
}

proc update_PARAM_VALUE.SOURCES { PARAM_VALUE.SOURCES } {
	# Procedure called to update SOURCES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SOURCES { PARAM_VALUE.SOURCES } {
	# Procedure called to validate SOURCES
	return true
}

proc update_PARAM_VALUE.TARGETS { PARAM_VALUE.TARGETS } {
	# Procedure called to update TARGETS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TARGETS { PARAM_VALUE.TARGETS } {
	# Procedure called to validate TARGETS
	return true
}


proc update_MODELPARAM_VALUE.HADDR_SIZE { MODELPARAM_VALUE.HADDR_SIZE PARAM_VALUE.HADDR_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HADDR_SIZE}] ${MODELPARAM_VALUE.HADDR_SIZE}
}

proc update_MODELPARAM_VALUE.HDATA_SIZE { MODELPARAM_VALUE.HDATA_SIZE PARAM_VALUE.HDATA_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HDATA_SIZE}] ${MODELPARAM_VALUE.HDATA_SIZE}
}

proc update_MODELPARAM_VALUE.SOURCES { MODELPARAM_VALUE.SOURCES PARAM_VALUE.SOURCES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SOURCES}] ${MODELPARAM_VALUE.SOURCES}
}

proc update_MODELPARAM_VALUE.TARGETS { MODELPARAM_VALUE.TARGETS PARAM_VALUE.TARGETS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TARGETS}] ${MODELPARAM_VALUE.TARGETS}
}

proc update_MODELPARAM_VALUE.PRIORITIES { MODELPARAM_VALUE.PRIORITIES PARAM_VALUE.PRIORITIES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PRIORITIES}] ${MODELPARAM_VALUE.PRIORITIES}
}

proc update_MODELPARAM_VALUE.MAX_PENDING_COUNT { MODELPARAM_VALUE.MAX_PENDING_COUNT PARAM_VALUE.MAX_PENDING_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_PENDING_COUNT}] ${MODELPARAM_VALUE.MAX_PENDING_COUNT}
}

proc update_MODELPARAM_VALUE.HAS_THRESHOLD { MODELPARAM_VALUE.HAS_THRESHOLD PARAM_VALUE.HAS_THRESHOLD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_THRESHOLD}] ${MODELPARAM_VALUE.HAS_THRESHOLD}
}

proc update_MODELPARAM_VALUE.HAS_CONFIG_REG { MODELPARAM_VALUE.HAS_CONFIG_REG PARAM_VALUE.HAS_CONFIG_REG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_CONFIG_REG}] ${MODELPARAM_VALUE.HAS_CONFIG_REG}
}

