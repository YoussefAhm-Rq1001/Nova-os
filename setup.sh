#!/bin/bash
set -e

echo "Installing Nova OS..."

sudo apt update
sudo apt install -y git curl fastfetch htop

sudo cp config/motd /etc/motd

echo "Nova OS installed! Restart your terminal."

sudo sed -i --follow-symlinks "s/^PRETTY_NAME=.*/PRETTY_NAME=\"Nova OS 0.1\"/" /etc/os-release
sudo sed -i --follow-symlinks 's/^NAME=.*/NAME="Nova OS"/; s/^VERSION=.*/VERSION="0.1"/' /etc/os-release
sudo sed -i --follow-symlinks 's/^NAME=.*/NAME="Nova OS"/; s/^VERSION=.*/VERSION="0.1"/' /etc/os-release
sudo install -m 755 scripts/nova-update /usr/local/bin/nova-update

# Nova OS look and feel
sudo install -m 644 config/wsl.conf /etc/wsl.conf
mkdir -p ~/.config/fastfetch
cp config/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
sudo install -m 644 config/nova-prompt.sh /etc/nova-prompt.sh
grep -q nova-prompt ~/.bashrc || echo 'source /etc/nova-prompt.sh' >> ~/.bashrc

# Nova OS commands
sudo install -m 755 scripts/nova-version /usr/local/bin/nova-version
sudo install -m 755 scripts/nova-info /usr/local/bin/nova-info
