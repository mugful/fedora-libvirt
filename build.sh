#!/bin/bash

set -euxo pipefail

dnf -y update --refresh
dnf -y install \
    nss-altfiles\
    libguestfs-tools \
    libvirt \
    libvirt-daemon-kvm \
    qemu-kvm \
    virt-manager \
    virt-viewer
dnf clean all

mv /etc/libvirt /etc/libvirt-default
mkdir /etc/libvirt
mv /usr/lib/firewalld /usr/lib/firewalld-libvirt
mkdir /usr/lib/firewalld
