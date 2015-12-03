/bin/rm initramfs_data.cpio.gz
cwd=`pwd`
initrd=initrd.img-3.16.0-4-amd64
cp /boot/$initrd /tmp/
/bin/rm -rf /tmp/initrd
mkdir /tmp/initrd
cd /tmp/initrd
zcat ../$initrd | cpio -i -d -H newc --no-absolute-filenames
#copy modules
/bin/rm -rf /tmp/initrd/lib/modules/*
cp -r /lib/modules/4.3.0-rc1+ /tmp/initrd/lib/modules
find . | cpio -o -H newc | gzip > $cwd/initramfs_data.cpio.gz
/bin/rm -rf /tmp/initrd
