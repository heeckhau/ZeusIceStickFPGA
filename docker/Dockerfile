FROM       centos:centos7
MAINTAINER Hendrik Eeckhaut <hendrik.eeckhaut@sigasi.com>

#RUN yum -y install epel-release
RUN yum -y update

RUN yum -y install dnf install make automake gcc gcc-c++ kernel-devel clang bison \
                 flex readline-devel gawk tcl-devel libffi-devel git mercurial \
                 graphviz python-xdot pkgconfig python python3 libftdi-devel \
  && yum clean all

#Installing the IceStorm Tools (icepack, icebox, iceprog, icetime, chip databases):

RUN git clone https://github.com/cliffordwolf/icestorm.git icestorm; \
    cd icestorm; \
    make -j$(nproc); \
    sudo make install;

# Installing Arachne-PNR (the place&route tool):

RUN git clone https://github.com/cseed/arachne-pnr.git arachne-pnr; \
	cd arachne-pnr; \
	make -j$(nproc); \
	sudo make install;

# Installing Yosys (Verilog synthesis):

RUN git clone https://github.com/cliffordwolf/yosys.git yosys; \
	cd yosys; \
	make -j$(nproc); \
	sudo make install;

#RUN pip install --upgrade pip
#RUN pip install pylibftdi jenkinsapi --upgrade
#
#ADD python python
