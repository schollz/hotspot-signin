#!/bin/bash

# install needed packages
sudo apt install --no-install-recommends network-manager dnsmasq-base python3 python3-pip wget curl zsh g++ git

# systemd
sudo mkdir -p /etc/systemd/system.conf.d

# NetworkManager config
sudo cp config/interfaces /etc/network/interfaces
sudo cp config/network-manager/100-disable-wifi-mac-randomization.conf /etc/NetworkManager/conf.d/
sudo cp config/network-manager/101-logging.conf /etc/NetworkManager/conf.d/
sudo cp config/network-manager/200-disable-nmcli-auth.conf /etc/NetworkManager/conf.d/
sudo systemctl disable pppd-dns.service

# uninstall packages we don't need
sudo apt purge libraspberrypi-doc modemmanager


# cleanup
sudo apt --purge -y autoremove
