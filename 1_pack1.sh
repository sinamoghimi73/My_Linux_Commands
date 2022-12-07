#!/bin/bash
apt update -y  
apt install git curl build-essential cmake ssh openssh-server python3-pip -y
systemctl enable ssh
systemctl start ssh
ufw allow ssh
ufw enable
reboot

