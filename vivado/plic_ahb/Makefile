.PHONY: all clean ip

RTL_DIR := ../../rtl/verilog
MODULES := $(RTL_DIR)/core/plic_cell.sv \
			$(RTL_DIR)/core/plic_core.sv \
			$(RTL_DIR)/core/plic_dynamic_registers.sv \
			$(RTL_DIR)/core/plic_gateway.sv \
			$(RTL_DIR)/core/plic_priority_index.sv \
			$(RTL_DIR)/core/plic_target.sv \
			$(RTL_DIR)/apb4/apb4_plic_top.sv \

all: ip

clean: 
	-@$(RM) component.xml
	-@$(RM) -rf xgui

ip: component.xml

component.xml xgui: $(MODULES) package_ip.tcl
	vivado -mode batch -source package_ip.tcl
