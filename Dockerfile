# Use offical Ubuntu image
FROM ubuntu:latest

# Myself
MAINTAINER jarek.grzabel@gmail.com

# Let's add necessary packages...
RUN useradd psi
RUN apt-get update -y
RUN apt-get install curl build-essential curl qt5-default libidn2-0-dev libidn11 libidn11-dev libqca-qt5-2-dev libqt5x11extras5-dev qtmultimedia5-dev -y

# Download PSI
RUN curl -o /tmp/psi-1.3.xz https://10gbps-io.dl.sourceforge.net/project/psi/Psi/1.3/psi-1.3.tar.xz
RUN cd /tmp && tar xf psi-1.3.xz && cd /tmp/psi-1.3/ && \
       ./configure --prefix=/opt/psi && make && make install

# Create PSI user
USER psi
ENV HOME /home/psi

# Run PSI
CMD /opt/psi/bin/psi
