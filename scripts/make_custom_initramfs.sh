#mkdir sub
#cp hello sub/init
#cd sub
/bin/rm initramfs_data.cpio.gz
cd initramfs
find . | cpio -o -H newc | gzip > ../initramfs_data.cpio.gz
cd ..
#rm -rf sub

#zcat initramfs_data.cpio.gz | cpio -i -d -H newc --no-absolute-filenames
