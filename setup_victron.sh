#!/bin/bash

clear
echo "move into home directory of the user root."
cd /home/root
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "download the latest tailscale package."
# ( Check latest version "arm" at https://pkgs.tailscale.com/stable/#static )
curl -o tailscale_loc.tgz https://pkgs.tailscale.com/stable/tailscale_1.46.1_arm.tgz
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "uncompress the package."
tar -xvf tailscale_loc.tgz
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "copy the nessesary files to /usr/bin."
cp tailscale tailscaled /usr/bin/
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "copy the nessesary file to /etc/init.d."
cp /home/root/tailscale_on_venus_os/etc/init.d/tailscaled /etc/init.d/
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "make init script executable"
chmod +x /etc/init.d/tailscaled
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "test the init script"
/etc/init.d/tailscaled start
/etc/init.d/tailscaled stop
/etc/init.d/tailscaled start
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "configure tailscale init script to start automatically on boot"
update-rc.d tailscaled defaults
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "enable ip-forward"
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf sudo sysctl -p /etc/sysctl.conf
echo "done."
sleep 1
echo "press any key to continue"
read -s -n 1
clear

echo "connect to your tailscale account"
tailscale up --advertise-routes=192.168.77.0/24

echo "if there was no errors, tailscale should be installed and ready!"