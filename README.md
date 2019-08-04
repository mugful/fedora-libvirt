fedora-libvirt
==============

A libvirt container image built on Fedora.

Pull
----

Either pull from Quay.io:

    podman pull quay.io/mugful/fedora-libvirt:master

Or build your own:

    git clone https://github.com/mugful/fedora-libvirt
    cd fedora-libvirt
    buildah bud -t mugful/fedora-libvirt:master .


Run
---

    sudo mkdir /etc/libvirt
    sudo mkdir /var/lib/libvirt

    # libvirt
    sudo podman run \
    --rm --privileged --pid=host --net=host -ti \
    --security-opt label=disable \
    -v /dev:/dev \
    -v /etc/libvirt:/etc/libvirt:z \
    -v /lib/modules:/lib/modules:ro \
    -v /run:/run \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    -v /var/lib/libvirt:/var/lib/libvirt:shared,z \
    quay.io/mugful/fedora-libvirt:master

    # virsh
    sudo podman run \
    --rm --privileged --pid=host --net=host -ti \
    --security-opt label=disable \
    -v /run:/run \
    -v /etc/libvirt:/etc/libvirt \
    -v /var/run/libvirt:/var/run/libvirt:shared,z \
    quay.io/mugful/fedora-libvirt:master bash
