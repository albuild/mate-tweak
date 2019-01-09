FROM amazonlinux:2.0.20181114

ARG version
ARG target_version

RUN yum -y update
RUN yum -y install \
  git \
  python3 \
  rpm-build
RUN curl -O http://mirror.centos.org/centos/7/os/x86_64/Packages/intltool-0.50.2-7.el7.noarch.rpm
RUN yum -y install intltool-0.50.2-7.el7.noarch.rpm
RUN curl -O http://dl.fedoraproject.org/pub/fedora/linux/releases/29/Everything/x86_64/os/Packages/p/python3-distutils-extra-2.39-9.fc29.noarch.rpm
RUN yum -y install python3-distutils-extra-2.39-9.fc29.noarch.rpm

RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/ubuntu-mate/mate-tweak.git

WORKDIR /app/mate-tweak
RUN git checkout -b build $target_version
RUN ./setup.py build
RUN ./setup.py install --root /dest --prefix=/usr

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}
WORKDIR /root/rpmbuild
ADD rpm.spec SPECS
RUN find /dest -type f | sed 's,^/dest,,' | sed 's,^\(/usr/share/man/man[1]/.\+\.[1]\)$,\1.gz,' >> SPECS/rpm.spec
RUN find /dest -type l | sed 's,^/dest,,' | sed 's,^\(/usr/share/man/man[1]/.\+\.[1]\)$,\1.gz,' >> SPECS/rpm.spec
RUN rpmbuild -bb SPECS/rpm.spec