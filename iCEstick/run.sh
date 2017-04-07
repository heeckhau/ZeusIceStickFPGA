#!/bin/bash
ghdl -a leds.vhd
yosys -m ~/git/ghdlsynth-beta/ghdl.so -p 'ghdl leds; synth_ice40 -blif leds.blif'
arachne-pnr -d 1k -o leds.asc -p leds.pcf leds.blif
icepack leds.asc leds.bin
iceprog leds.bin
