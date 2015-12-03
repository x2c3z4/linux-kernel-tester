#!/bin/sh
kernel=~/linux/arch/x86_64/boot/bzImage
initrd=`pwd`/initramfs_data.cpio.gz
#extra="-drive file=rootfs.img,media=disk" #-hda rootfs.img
#extra=-enable-kvm
qemu-system-x86_64 -kernel $kernel -initrd $initrd -m 2G -hda rootfs.img $extra -append "console=ttyS0,115200 root=/dev/sda" -nographic -redir tcp:3333::22
