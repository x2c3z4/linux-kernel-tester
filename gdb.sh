#gdb -ex 'target remote localhost:1234' -ex c ~/devel/linux/arch/i386/boot/bzImage
gdb -ex 'target remote localhost:1234' -ex c $1/arch/$arch/boot/bzImage

