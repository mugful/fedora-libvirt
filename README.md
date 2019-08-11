fedora-libvirt
==============

A libvirt container image built on Fedora. Intended for systems like
immutable systems which don't ship libvirt in the base layer, like
Fedora Silverblue.

Pull
----

Either pull from Quay.io:

    podman pull quay.io/mugful/fedora-libvirt:master

Or build your own:

    git clone https://github.com/mugful/fedora-libvirt
    cd fedora-libvirt
    buildah bud -t mugful/fedora-libvirt:master .


Run via Systemd
---------------

Copy the files from `host-files` onto your system, either manually or
via `sudo ./install.sh`. Then run:

    sudo systemctl daemon-reload
    sudo systemctl start mugful-libvirtd

If you want to connect to libvirt as non-root user, run also:

    sudo mugful-libvirtd-rootless-enable

Run manually
------------

    sudo mkdir -p /etc/libvirt
    sudo mkdir -p /run/libvirt
    sudo mkdir -p /var/lib/libvirt

    # libvirt
    sudo podman run \
    --rm --privileged --pid=host --net=host -ti \
    --security-opt label=disable \
    -v /dev:/dev \
    -v /etc/group:/etc/group:ro \
    -v /etc/libvirt:/etc/libvirt:z \
    -v /etc/nsswitch.conf:/etc/nsswitch.conf:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /lib/modules:/lib/modules:ro \
    -v /run/dbus:/run/dbus:shared \
    -v /run/libvirt:/run/libvirt:shared,z \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    -v /usr/lib/group:/usr/lib/group:ro \
    -v /usr/lib/passwd:/usr/lib/passwd:ro \
    -v /var/lib/libvirt:/var/lib/libvirt:shared,z \
    quay.io/mugful/fedora-libvirt:master

    # virsh
    sudo podman run \
    --rm --pid=host --net=host -ti \
    --security-opt label=disable \
    -v /run/libvirt:/run/libvirt:shared,z \
    quay.io/mugful/fedora-libvirt:master bash
