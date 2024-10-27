#!/bin/bash
#sudo chmod +x restoreplex.sh
#This script will restore plex meta data to your server from your NAS.
echo "**WARNING** This will DELETE all your existing PLEX meta data"
echo "**WARNING** and restore it from your NAS."
while true; do
    read -p "Is this what you want to do [y/n]? " yn
    case $yn in
        [Yy]* ) echo "You answered Yes";
                sudo rm -R ~/docker/plexms/.
                sudo rsync -avW /media/NASPlexMediaNFS/BackupPlex/plexms/. ~/docker/plexms/  
                break;;
        [Nn]* ) echo "You answered No";
                exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
