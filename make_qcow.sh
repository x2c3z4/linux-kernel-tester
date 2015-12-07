qemu-img create -f qcow2 debian.qcow 5G
#qemu-img convert 虚拟磁盘-s001.vmdk 虚拟磁盘-s002.vmdk 虚拟磁盘-s003.vmdk 虚拟磁盘-s004.vmdk 虚拟磁盘-s005.vmdk 虚拟磁盘-s006.vmdk -O qcow2 guest.qcow2
#qemu-img convert -c  debian.qcow2 -O qcow2 debian.img
