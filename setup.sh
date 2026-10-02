#!/bin/bash
set -e

echo "Installing Nova OS..."

sudo apt update
sudo apt install -y git curl fastfetch htop

sudo cp config/motd /etc/motd

echo "Nova OS installed! Restart your terminal."

