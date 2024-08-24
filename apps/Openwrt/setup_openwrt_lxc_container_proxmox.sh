#!/bin/bash

# Setting Up OpenWRT on a Virtual Machine with Proxmox
# Based on: https://community.bigbeartechworld.com/t/setting-up-openwrt-on-a-virtual-machine-with-proxmox/257

# Set your wished version:
export VER="23.05"
export ARCH="amd64"
export INDEX_URL="https://images.linuxcontainers.org/images/openwrt/$VER/$ARCH/default"
#export BUILDDATE=$(date -d "yesterday" '+%Y%m%d')
export BUILDDATE=$(curl -sL $INDEX_URL | grep "<a href=" | sed -E 's/.*<a href="([^"]+)".*/\1/' | sort | tail -n 1 | tr -d \/)
export BD_URL="$INDEX_URL/$BUILDDATE"

echo; echo "[*] Setting Up OpenWRT Version $VER on a Virtual Machine with Proxmox"
echo "[*] Downloading by $BD_URL/ "
sleep 2
wget $BD_URL/rootfs.tar.xz -O /var/lib/vz/template/cache/OpenWrt-$VER.tar.xz
# lvm disk: 1G - RAM 1G - CPU 1Core 64bit
#
pct create 202 /var/lib/vz/template/cache/OpenWrt-$VER.tar.xz --arch $ARCH --hostname OpenWrt-$VER --rootfs local-lvm:1 --memory 1024 --cores 1 --ostype unmanaged --unprivileged 1

echo -e "
Add network on interface and setup network file via dhcp 

(vi /etc/config/network):

config interface 'wrtb'
        option type 'bridge'
        option ifname 'eth0'
        option proto 'dhcp'
"

exit 0;
