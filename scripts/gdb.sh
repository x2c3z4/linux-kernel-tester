#!/bin/bash
#gdb -ex 'target remote localhost:1234' -ex c ~/devel/linux/arch/i386/boot/bzImage
kernel_path=$1
arch=x86_64
[[ $2 != "" ]] && arch=$2
#gdb -ex 'target remote localhost:1234' -ex c $kernel_path/arch/$arch/boot/bzImage
gdb -ex 'target remote localhost:1234' -ex c $kernel_path/vmlinux

