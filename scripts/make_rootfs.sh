#!/bin/bash
#i386 amd64
arch=amd64
[[ $1 != "" ]] && arch=$1
#apt-get install ubuntu-dev-tools && mk-sbuild --arch=amd64 jessie
dd if=/dev/zero of=rootfs.img bs=1 count=0 seek=3000M
mkfs.ext4 -b 4096 -F rootfs.img
mkdir /tmp/rootfs
mount -o loop rootfs.img /tmp/rootfs
#cp -ar /var/lib/schroot/chroots/jessie-$arch/* /tmp/rootfs/
cp -ar /var/lib/schroot/chroots/sid-$arch/* /tmp/rootfs/
umount /tmp/rootfs
/bin/rm -rf /tmp/rootfs
