#!/bin/bash
set -e

echo "Installing Nova OS..."

sudo apt update
sudo apt install -y git curl fastfetch htop

sudo cp config/motd /etc/motd

echo "Nova OS installed! Restart your terminal."

sudo sed -i --follow-symlinks "s/^PRETTY_NAME=.*/PRETTY_NAME=\"Nova OS 0.1\"/" /etc/os-release
sudo sed -i --follow-symlinks 's/^NAME=.*/NAME="Nova OS"/; s/^VERSION=.*/VERSION="0.1"/' /etc/os-release
