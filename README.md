### Download and unpack this repo on your device.

```
wget https://github.com/mcfrojd/tailscale_on_venus_os/archive/refs/heads/master.zip
unzip master.zip "tailscale_on_venus_os-master/*" -d /home/root/
rm master.zip
cd tailscale_on_venus_os-master
chmod a+x setup_victron.sh
clear
ls -al
./setup_victron.sh
```


### Before running the "setup_venus.sh" script

### Check latest version "arm" at https://pkgs.tailscale.com/stable/#static

### ( arm: tailscale_x.xx.x_arm.tgz )

### And change the version number in the script ( `nano setup_victron.sh` ).

### Then run the script with:

```
./setup_victron.sh
```

