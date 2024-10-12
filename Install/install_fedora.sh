#!/bin/bash

echo "=============================="
echo "Fedora detected!"
echo "Updating system and installing packages..."
echo "=============================="

sudo dnf update -y
sudo dnf install -y hyprland dunst cava wofi waybar swww
