#!/usr/bin/env bash

dnf -y update

sudo dnf -y install make automake gcc gcc-c++ kernel-devel clang bison \
                 flex readline-devel gawk tcl-devel libffi-devel git mercurial \
                 graphviz python-xdot pkgconfig python python3 libftdi-devel \
                 gcc-gnat 
dnf clean all

#Installing the IceStorm Tools (icepack, icebox, iceprog, icetime, chip databases):

git clone https://github.com/cliffordwolf/icestorm.git icestorm; \
    cd icestorm; \
    make -j$(nproc); \
    sudo make install;

# Installing Arachne-PNR (the place&route tool):

git clone https://github.com/cseed/arachne-pnr.git arachne-pnr; \
	cd arachne-pnr; \
	make -j$(nproc); \
	sudo make install;

# Installing Yosys (Verilog synthesis):

git clone https://github.com/cliffordwolf/yosys.git yosys; \
	cd yosys; \
	make -j$(nproc); \
	sudo make install;

# GHDL

git clone https://github.com/tgingold/ghdl.git ghdl; \
    cd ghdl; \
    ./configure --prefix=/usr/local; \
    make -j$(nproc); \
    sudo make install; \
    make libghdlsynth.so; \
    sudo make install.libghdlsynth.shared;

git clone https://github.com/tgingold/ghdlsynth-beta.git ghdlsynth-beta; \
    cd ghdlsynth-beta; \
    make GHDL_PREFIX=../ghdl; 



