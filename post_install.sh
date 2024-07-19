#!/bin/sh

sudo apt update -y && sudo apt upgrade -y

#############################
#### Packages to install ####
#############################

sudo apt install git -y
sudo apt install make -y
sudo apt install curl -y
sudo apt install nmap -y
sudo apt install neofetch -y
sudo apt install wireshark -y
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remonte-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install qemu-system libvirt-daemon-system -y
sudo apt install virt-manager -y
sudo usermod -aG libvirt $USER

#################
#### Mullvad ####
#################

wget --trust-server-names https://mullvad.net/download/app/deb/latest # Extract the downloaded deb file name
deb_file=$(ls MullvadVPN*.deb) # Extract the version from the deb file name
version=$(echo "$deb_file" | grep -oP 'MullvadVPN-\K([0-9]+\.?){1,3}')
sudo apt install ./"$deb_file" # Install the .deb file
echo "MullvadVPN version $version has been installed." # Display the installed version

####################
###### Pcloud ######
####################

# You must check the link on the website first and change it if needed !!!!
wget https://p-lux3.pcloud.com/cBZcsG3gAZUAIbnL7ZZZY3abkkZ2ZZzL5ZkZ0qLxVZDLZ0HZw8Z6RZwRZYRZwpZrRZ5QZDQZt8ZEFZOpZjQZQDbs0ZoTXLLbucfCb4BYAzxfYE8L9jW7z7/pcloud
chmod +x pcloud
./pcloud

######################
#### Remove games ####
######################

sudo apt remove aisleriot five-or-more four-in-a-row gnome-chess hitori gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-taquin gnome-tetravex iagno lightsoff quadrapassel swell-foop tali 2048 -y

#################################
#### Add extensions managers ####
#################################

sudo apt install gnome-tweaks -y && sudo apt install gnome-shell-extensions -y && sudo apt install gnome-shell-extension-manager -y

###################################
#### add extensions to firefox ####
###################################

# Ublock
sudo apt install webext-ublock-origin-firefox -y

# Bitwarden
wget "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/addon-607454-latest.xpi" -O /tmp/bitwarden.xpi
# Check if successful
if [ $? -eq 0 ]; then
    echo "Download successfull !!!"
# Installation, we still have to click on Firefox !
    firefox  /tmp/bitwarden.xpi
    echo "Bitwarden has been successfully installed."
else
    echo "Error !!!"
fi

#################
#### Reboot #####
#################

sleep 5
sudo reboot
