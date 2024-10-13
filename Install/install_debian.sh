#!/bin/bash

# Log file for installation
LOGFILE="install_packages.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Exit immediately if a command exits with a non-zero status
set -e

echo "=============================="
echo "Debian/Ubuntu detected!"
echo "Updating system and installing packages..."
echo "=============================="

# Update system
if sudo apt update -y; then
    echo "System updated successfully."
else
    echo "Failed to update the system."
    exit 1
fi

# List of packages to install
packages=("hyprland" "dunst" "cava" "wofi" "waybar" "swww" "alacritty" "pavucontrol")
echo "=============================="
echo "Installing packages..."
for package in "${packages[@]}"; do
    if dpkg -l | grep -qw "$package"; then
        echo "$package is already installed."
    else
        echo "Installing $package..."
        if sudo apt install -y "$package"; then
            echo "$package installed successfully."
        else
            echo "Failed to install $package."
            exit 1
        fi
    fi
done

echo "=============================="
echo "All packages installed successfully!"
echo "=============================="
