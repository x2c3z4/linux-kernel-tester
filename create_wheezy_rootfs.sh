# Build a Wheezy chroot. Install an sshd, since it will be handy
# later.
mkdir wheezy
sudo debootstrap wheezy wheezy --include=openssh-server

# Perform some manual cleanup on the resulting chroot:

# Make root passwordless for convenience.
sudo sed -i '/^root/ { s/:x:/::/ }' wheezy/etc/passwd
# Add a getty on the virtio console
echo 'V0:23:respawn:/sbin/getty 115200 hvc0' | sudo tee -a wheezy/etc/inittab
# Automatically bring up eth0 using DHCP
printf '\nauto eth0\niface eth0 inet dhcp\n' | sudo tee -a wheezy/etc/network/interfaces
# Set up my ssh pubkey for root in the VM
sudo mkdir wheezy/root/.ssh/
cat ~/.ssh/id_?sa.pub | sudo tee wheezy/root/.ssh/authorized_keys

# Build a disk image
dd if=/dev/zero of=wheezy.img bs=1M seek=4095 count=1
mkfs.ext4 -F wheezy.img
sudo mkdir -p /mnt/wheezy
sudo mount -o loop wheezy.img /mnt/wheezy
sudo cp -a wheezy/. /mnt/wheezy/.
sudo umount /mnt/wheezy

# At this point, you can delete the "wheezy" directory. I usually
# keep it around in case I've messed up the VM image and want to
# recreate it.
