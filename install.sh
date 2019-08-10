#!/bin/bash

set -euxo pipefail

cp host-files/etc/systemd/system/mugful-libvirtd.service /etc/systemd/system/mugful-libvirtd.service
# copying to bin instead of sbin because of https://bugzilla.redhat.com/show_bug.cgi?id=1739783
cp host-files/usr/local/sbin/mugful-libvirtd /usr/local/bin/mugful-libvirtd
chmod a+x /usr/local/bin/mugful-libvirtd
