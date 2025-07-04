#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print a message in green
function print_green() {
    echo -e "\e[32m$1\e[0m"
}

print_green "Updating package index..."
sudo apt-get update

print_green "Upgrading installed packages..."
sudo apt-get upgrade -y

print_green "Installing basic tools..."
sudo apt-get install -y curl git build-essential ufw htop unzip

# Uncomment the following block if you want to install Docker
: '
print_green "Installing Docker..."
sudo apt-get remove docker docker-engine docker.io containerd runc || true
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

print_green "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
'

# Uncomment the following block to set up a new user
: '
NEW_USER="yourusername"
print_green "Creating new user: $NEW_USER"
sudo adduser $NEW_USER
sudo usermod -aG sudo $NEW_USER
'

print_green "All done! Please reboot if necessary."
