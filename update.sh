#!/bin/bash
#chmod +x update.sh
#./update.sh
echo "Updating"
sudo apt update
sudo apt upgrade -y
cd docker
docker compose up -d
