#!/bin/bash
#sudo chmod +x update.sh
#sudo ./update.sh
echo "Updating System Files"
sudo apt update
sudo apt upgrade -y
echo "Backing Up Plex Meta Data To NAS"
sudo rsync -avW ~/docker/.  /media/NASPlexMediaNFS/BackupPlex/
echo "Cleaning up any incomplete downloads"
sudo rm -R ~/Downloads/incomplete/
sudo rm -R ~/Downloads/completed/movies/
sudo rm -R ~/Downloads/completed/tv/
echo "Updating All *Arrs, Plex"
cd docker
docker compose up -d
echo "Recommend you do a reboot, type 'sudo reboot now'"
