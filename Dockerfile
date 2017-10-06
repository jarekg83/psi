# Use offical Centos 7 image
FROM centos:7

# Myself
MAINTAINER jarek.grzabel@gmail.com

# Let's add necessary packages...
RUN yum install epel-release -y
RUN yum install qt5-qtbase-devel libidn-devel libidn2-devel qca-qt5-devel zlib-devel qt5-qtx11extras-devel qt5-qtmultimedia-devel -y
RUN yum groupinstall "Development Tools" -y
#RUN ln -s /usr/bin/qmake-qt5 /usr/bin/gmake 
# Download PSI
RUN curl -o /tmp/psi-1.3.xz https://10gbps-io.dl.sourceforge.net/project/psi/Psi/1.3/psi-1.3.tar.xz
RUN cd /tmp && tar xf psi-1.3.xz && cd /tmp/psi-1.3/ && \
       ./configure --prefix=/opt/psi --qtdir=/ && gmake && gmake install

# Run PSI
CMD /opt/psi/bin/psi
