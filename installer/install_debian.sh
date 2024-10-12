#!/bin/bash

echo "=============================="
echo "Debian/Ubuntu detected!"
echo "Updating system and installing packages..."
echo "=============================="

sudo apt update -y
sudo apt install -y hyprland dunst cava wofi waybar swww
