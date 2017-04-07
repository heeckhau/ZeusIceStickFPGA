#!/usr/bin/env bash

dnf -y update

sudo dnf -y install make automake gcc gcc-c++ kernel-devel clang bison \
                 flex readline-devel gawk tcl-devel libffi-devel git mercurial \
                 graphviz python-xdot pkgconfig python python3 libftdi-devel \
                 gcc-gnat usbutils
dnf clean all

echo "Sigasi" | sudo passwd vagrant --stdin

#Installing the IceStorm Tools (icepack, icebox, iceprog, icetime, chip databases):
mkdir git
pushd git

git clone https://github.com/cliffordwolf/icestorm.git icestorm; \
    pushd icestorm; \
    make -j$(nproc); \
    sudo make install; \
    popd;

# Installing Arachne-PNR (the place&route tool):

git clone https://github.com/cseed/arachne-pnr.git arachne-pnr; \
	pushd arachne-pnr; \
	make -j$(nproc); \
	sudo make install; \
    popd;

# Installing Yosys (Verilog synthesis):

git clone https://github.com/cliffordwolf/yosys.git yosys; \
	pushd yosys; \
	make -j$(nproc); \
	sudo make install; \
    popd;

# GHDL

git clone https://github.com/tgingold/ghdl.git ghdl; \
    pushd ghdl; \
    ./configure --prefix=/usr/local; \
    make -j$(nproc); \
    sudo make install; \
    make libghdlsynth.so; \
    sudo make install.libghdlsynth.shared; \
    popd;

git clone https://github.com/tgingold/ghdlsynth-beta.git ghdlsynth-beta; \
    pushd ghdlsynth-beta; \
    make GHDL_PREFIX=/usr/local; \
    popd

popd