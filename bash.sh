#!/bin/bash
sudo su
apt update -y
apt upgrade -y

apt purge roc* -y
apt update -y 
apt install linux-generic-hwe-18.04 -y
sudo apt upgrade -y
wget https://drivers.amd.com/drivers/linux/19.50/amdgpu-pro-19.50-967956-ubuntu-18.04.tar.xz --referer https://www.amd.com/en/support/kb/release-notes/rn-rad-lin-19-50-unified
tar -Jxvf amdgpu-pro-19.50-967956-ubuntu-18.04.tar.xz
cd amdgpu-pro-19.50-967956-ubuntu-18.04
./amdgpu-pro-install -y --opencl=pal,legacy,rocm --headless --no-dkms
wget https://github.com/todxx/teamredminer/releases/download/0.8.1.1/teamredminer-v0.8.1.1-linux.tgz
tar xvf teamredminer-v0.8.1.1-linux.tgz
