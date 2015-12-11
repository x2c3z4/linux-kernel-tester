cwd=`pwd`
kernel_version=$1 #4.3.0-rc1+
initrd=$2
#initrd=initramfs_data.cpio.gz #initrd.img-3.16.0-4-amd64
#/bin/rm initramfs_data.cpio.gz
#cp /boot/$initrd /tmp/
cp $initrd /tmp
/bin/rm -rf /tmp/initrd
mkdir /tmp/initrd
cd /tmp/initrd
zcat ../$initrd | cpio -i -d -H newc --no-absolute-filenames
#copy modules
/bin/rm -rf /tmp/initrd/lib/modules/*
cp -r /lib/modules/$kernel_version /tmp/initrd/lib/modules
#find . | cpio -o -H newc | gzip -9 > $cwd/initramfs_data.cpio.gz
find . | cpio -o -H newc | gzip > $cwd/initramfs_data.cpio.gz
/bin/rm -rf /tmp/initrd
