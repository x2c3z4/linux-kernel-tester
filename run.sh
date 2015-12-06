#!/bin/sh
#./run.sh ~/devel/linux i386
kernel_path=$1 #~/linux
arch=$2 #x86_64
kernel=$kernel_path/arch/$2/boot/bzImage
initrd=`pwd`/initramfs_data.cpio.gz
rootfs=debian.qcow2

#extra="-drive file=rootfs.img,media=disk" #-hda rootfs.img
#extra=-enable-kvm
#extra="-redir tcp:3333::22"
extra=
exec_name=qemu-system-$arch
#network="-net nic,model=e1000,vlan=0 -net tap,ifname=tap0,vlan=0,script=no"
#network="-net nic,model=virtio -net tap,ifname=tap0,script=no,downscript=no,vhost=on"
#network="-net nic,macaddr=$(./qemu-mac-hasher.py "qemu") -net vde"
#network="-net nic -net user -vnc :0 -net tap,ifname=vnet0,script=no,downscript=no"
#network="-net nic,model=? -net tap"
#network="-netdev user,id=mynet0,dns=xxx"
#-serial file:dmesg.log
$exec_name -s -kernel $kernel -initrd $initrd -m 1G -hda $rootfs $extra -append "console=ttyS0,115200 root=/dev/sda1 rw" -nographic $network
