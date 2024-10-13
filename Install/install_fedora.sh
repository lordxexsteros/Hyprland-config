#!/bin/bash

echo "=============================="
echo "Fedora detected!"
echo "Updating system and installing packages..."
echo "=============================="

# Update system
sudo dnf update -y

# Install packages from official repositories
sudo dnf install -y dunst cava wofi waybar alacritty pavucontrol swaylock

# Hyprland and related tools may not be in official repos
echo "Installing Hyprland and related packages..."

# Install Hyprland from a COPR repository (if available)
sudo dnf copr enable vikt0r/hyprland -y
sudo dnf install -y hyprland

# Hyprpaper may not be available in the official or COPR repos, so you may need to build it manually

echo "=============================="
echo "All possible packages installed successfully!"
echo "=============================="
