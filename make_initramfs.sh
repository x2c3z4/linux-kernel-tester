initrd=$1 #initrd.img-3.16.0-4-amd64
kernel_version=$2 #4.3.0-rc1+
/bin/rm initramfs_data.cpio.gz
cwd=`pwd`
cp /boot/$initrd /tmp/
/bin/rm -rf /tmp/initrd
mkdir /tmp/initrd
cd /tmp/initrd
zcat ../$initrd | cpio -i -d -H newc --no-absolute-filenames
#copy modules
/bin/rm -rf /tmp/initrd/lib/modules/*
cp -r /lib/modules/$kernel_version /tmp/initrd/lib/modules
find . | cpio -o -H newc | gzip > $cwd/initramfs_data.cpio.gz
/bin/rm -rf /tmp/initrd
