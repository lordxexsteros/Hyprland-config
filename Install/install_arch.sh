#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

LOGFILE="install_packages.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=============================="
echo "Arch Linux detected!"
echo "Updating system and installing packages..."
echo "=============================="

# Update system
if sudo pacman -Syu --noconfirm; then
    echo "System updated successfully."
else
    echo "Failed to update the system."
    exit 1
fi

# Install packages
packages=("hyprland" "dunst" "cava" "wofi" "waybar" "swww" "hyprpaper" "alacrity")
echo "=============================="
echo "Installing packages..."
for package in "${packages[@]}"; do
    echo "Installing $package..."
    if sudo pacman -S --noconfirm "$package"; then
        echo "$package installed successfully."
    else
        echo "Failed to install $package."
        exit 1
    fi
done

echo "=============================="
echo "All packages installed successfully!"
echo "=============================="
