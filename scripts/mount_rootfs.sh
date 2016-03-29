mkdir /mnt/debian
modprobe nbd max_part=63
qemu-nbd -c /dev/nbd0 debian.qcow2
mount -o sync /dev/nbd0p1 /mnt/debian
