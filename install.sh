#!/bin/bash

set -euxo pipefail

cp host-files/etc/systemd/system/mugful-libvirtd.service /etc/systemd/system/mugful-libvirtd.service
cp host-files/usr/local/sbin/mugful-libvirtd /usr/local/sbin/mugful-libvirtd
cp host-files/usr/local/sbin/mugful-libvirtd-rootless-enable /usr/local/sbin/mugful-libvirtd-rootless-enable
chmod o+x /usr/local/bin/mugful-libvirtd
chmod o+x /usr/local/bin/mugful-libvirtd-rootless-enable
