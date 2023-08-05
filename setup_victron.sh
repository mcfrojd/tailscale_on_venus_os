#!/bin/bash

clear

#
# move into home directory of the user root.
#
echo "move into home directory of the user root."
echo ""
cd /home/root
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# download the latest tailscale package.
#
echo "download the latest tailscale package."
echo ""
curl -o tailscale_loc.tgz https://pkgs.tailscale.com/stable/tailscale_1.46.1_arm.tgz
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# uncompress the package.
#
echo "uncompress the package."
echo ""
tar -xvf tailscale_loc.tgz
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# copy the nessesary files to /usr/bin.
#
echo "copy the nessesary files to /usr/bin."
echo ""
cp tailscale tailscaled /usr/bin/
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# copy the nessesary file to /etc/init.d.
#
echo "copy the nessesary file to /etc/init.d."
echo ""
cp /home/root/tailscale_on_venus_os/etc/init.d/tailscaled /etc/init.d/
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# make init script executable
#
echo "make init script executable"
echo ""
chmod +x /etc/init.d/tailscaled
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# test the init script
#
echo "test the init script"
echo ""
/etc/init.d/tailscaled start
/etc/init.d/tailscaled stop
/etc/init.d/tailscaled start
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# configure tailscale init script to start automatically on boot
#
echo "configure tailscale init script to start automatically on boot"
echo ""
update-rc.d tailscaled defaults
echo "done."
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# enable ip-forward
#
echo "enable ip-forward"
echo ""
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf sudo sysctl -p /etc/sysctl.conf
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

#
# connect to your tailscale account
#
echo "connect to your tailscale account"
echo ""
tailscale up --advertise-routes=192.168.77.0/24

#
# if there was no errors, tailscale should be installed and ready!
#
echo "if there was no errors, tailscale should be installed and ready!"
echo ""
