FROM registry.fedoraproject.org/fedora:30
MAINTAINER Jiri Stransky <jistr@jistr.com>

COPY build.sh /root/build.sh
RUN /root/build.sh

COPY files /

CMD ["/usr/local/bin/container_libvirtd"]