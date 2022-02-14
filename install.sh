#!/bin/bash

# ---------------[ Apple Mac Plymouth Installation ]--------------
# -------------------------[version 1]------------------------
# ------------[ Created by Navis Michael Bearly ]------------
# ------------------[ michael.bearly@gmail.com ]------------------

Text='\033[1;32m'
NC='\033[0m'

if ((${EUID:-0} || "$(id -u)")); then
  clear
  sleep 1.5
  	echo -e "${NC}You are not root."
  sleep 1.0
  	echo "Please run this using sudo"
  sleep 1.0
  	echo -e "${Text}Aborted."
  sleep 1.5
  exit 1
else
  clear
  sleep 1.5
  	echo -e "${Text}Please wait until the installation is complete. This won't take too long"
  sleep 1.5
  	echo -e "${NC}Copying theme files"
  	cp -iRv MaterialLinuxMint /usr/share/plymouth/themes/
  sleep 1.5
  clear
  sleep 1.5
  	update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/MaterialLinuxMint/MaterialLinuxMint.plymouth 100
  	
  	echo -e "${Text}Configured"
  sleep 1.5
  clear
  	echo "Select Number of Plymouth Theme"
  sleep 1.0
    echo -e "${NC} Please choose the \"MaterialLinuxMint\" theme here"
  	update-alternatives --config default.plymouth
  	update-initramfs -u
  sleep 0.5
  	echo "Finished"
  sleep 1.5
  clear
fi
