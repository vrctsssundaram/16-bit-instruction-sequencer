IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_microseq16 -o build/sim rtl/microseq16.sv tb/tb_microseq16.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/microseq16.sv; hierarchy -check -top microseq16; synth -top microseq16; stat'
