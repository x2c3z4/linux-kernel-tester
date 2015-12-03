#sudo apt-get install uml-utilities bridge-utils
# For Network Bridging/TAP
# Set permissions of tun device
chown root.users /dev/net/tun 
chmod g+rw /dev/net/tun

#Add a bridge, add eth0
brctl addbr br0
ifconfig eth0 0.0.0.0 promisc
brctl addif br0 eth0
dhclient br0

# Create tap0
tunctl -t tap0 -u root #replace username by your username

# Enable tap0
brctl addif br0 tap0
#ifconfig tap0 up
ifconfig tap0 192.168.1.113 netmask 255.255.255.0 up
