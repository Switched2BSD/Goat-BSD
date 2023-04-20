#!/bin/sh
gitpath=$(pwd)
if [ "$(id -u)" != "0" ]; then
  echo "Please RUN this Shell Script as root !" 1>&2
  echo " And don't forget to Subscribe to my poor little channel"
  echo " https://www.youtube.com/channel/UCjGz2tP-6H-E4E00OVrPPIQ"
  echo " For Donations visit this link plz : "
  echo "https://streamelements.com/okboomertv/tip"
  exit 1
fi
echo "Welcome to the Goat-BSD Generator , we are gonna create your iso in a giffy !"
echo "But first be sure to Subscribe to my Channel Switched2BSD on YouTube plz !"
echo ".........................."
echo " lets create our work directory goat-bsd on root /root directory ! "
echo " Don't forget that you need to be root to delete this directory later !"
mkdir ~/goat-bsd
echo "Lets create the core directory now where all the work will be done there"
mkdir ~/goat-bsd/core
echo " Let's create the iso output directory now iso"
mkdir ~/goat-bsd/iso
echo " Let's create the temp(orary) directory now"
mkdir ~/goat-bsd/temp
echo " Let' create the sceleton directory its gonna have the pristine boot system without any goodies"
mkdir ~/goat-bsd/sceleton

echo " Lets switch to goat-bsd temp directory now"
cd ~/goat-bsd/temp
echo " lets try to download the base and kernel to create a pristine freebsd system root"
echo " For FreeBSD "$(uname -r) 
fetch https://download.freebsd.org/releases/amd64/$(uname -r)/base.txz
fetch https://download.freebsd.org/releases/amd64/$(uname -r)/kernel.txz
echo " Download complete ! lets extract them now ! "
echo " You have plenty of time to Subscribe to Switched2BSD on YouTube "
tar -zxvf base.txz -C ~/goat-bsd/core
tar -zxvf kernel.txz -C ~/goat-bsd/core
echo " lets copy the pristine system to sceleton"
cp -r ~/goat-bsd/core/ ~/goat-bsd/sceleton/
echo "decompression complete , now lets install some packages"
mkdir ~/goat-bsd/core/var/cache/pkg
mount -t devfs devfs ~/goat-bsd/core/dev
cp /etc/resolv.conf ~/goat-bsd/core/etc/
echo "mounted devfs on virtual root and copied resolv for temporarilly network access will delete it later"
echo "Just say yes to install pkg ok ?"
chroot ~/goat-bsd/core/ pkg install -y wget
chroot ~/goat-bsd/core/ wget tinyurl.com/freebsd-desktop-installer-git
chmod +x ~/goat-bsd/core/freebsd-desktop-installer-git
chroot ~/goat-bsd/core chmod +x freebsd-desktop-installer-git
echo " Let's Go ! Let's install some stuff now ! "
chroot ~/goat-bsd/core ./freebsd-desktop-installer-git
echo " ok installation should be complete now lets compress the whole thing now"



