#!/bin/bash
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
make menuconfig
#Set CONFIG_IP_PNP_DHCP=y and CONFIG_E1000=y to enable IP address
make -j2
make modules
INSTALL_MOD_PATH=./mods make modules_install
ln -s $PWD/mods/lib/modules/$(make kernelrelease) \
  /lib/modules/$(make kernelrelease)
dracut --kver "$(make kernelrelease)" \
  --add-drivers "iscsi_target_mod target_core_mod" \
  --add-drivers "target_core_file target_core_iblock" \
  --add-drivers "configfs" \
  --install "ps grep netstat" \
  --no-hostonly --no-hostonly-cmdline \
  --modules "bash base shutdown network ifcfg" initramfs
qemu-kvm -kernel arch/x86/boot/bzImage \
  -initrd initramfs \
  -device e1000,netdev=network0 \
  -netdev user,id=network0 \
  -redir tcp:51550::3260 \
  -append "ip=dhcp rd.shell=1 console=ttyS0" \
  -nographic
#ip a
#modprobe iscsi_target_mod
#mount -t configfs configfs /sys/kernel/config/
#mkdir /sys/kernel/config/target/iscsi
#iscsiadm --mode discovery \
#  --type sendtargets \
#  --portal 127.0.0.1:51550
