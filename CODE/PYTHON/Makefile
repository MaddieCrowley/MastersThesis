# Makefile
SIM ?= verilator
TOPLEVEL_LANG ?=verilog
VERILOG_SOURCES += $(PWD)/../VERILOG/*.sv
VERILOG_SOURCES += $(PWD)/../VERILOG/DDS/*.sv

COCOTB_TOPLEVEL = filter

COCOTB_TEST_MODULES = verification
include $(shell cocotb-config --makefiles)/Makefile.sim
