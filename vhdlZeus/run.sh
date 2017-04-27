#!/bin/bash
ghdl -a leds.vhd || exit -1
yosys -m /home/vagrant/git/ghdlsynth-beta/ghdl.so -p 'ghdl leds; synth_ice40 -blif leds.blif' || exit -1
arachne-pnr -d 1k -o leds.asc -p leds.pcf leds.blif || exit -1
icepack leds.asc leds.bin || exit -1
sudo /usr/local/bin/iceprog leds.bin || exit -1
