IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_microseq16 -o build/sim rtl/microseq16.sv tb/tb_microseq16.sv
	$(VVP) build/sim
