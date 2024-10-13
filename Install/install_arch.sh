#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

LOGFILE="$HOME/install_packages.log"
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

# Install official repository packages
official_packages=("dunst" "cava" "wofi" "waybar" "alacritty" "pavucontrol")
echo "=============================="
echo "Installing official packages..."
for package in "${official_packages[@]}"; do
    echo "Installing $package..."
    if sudo pacman -S --noconfirm "$package"; then
        echo "$package installed successfully."
    else
        echo "Failed to install $package."
        exit 1
    fi
done

# Install AUR packages using yay
aur_packages=("hyprland" "swaylockd" "hyprpaper")
echo "=============================="
echo "Installing AUR packages..."
for package in "${aur_packages[@]}"; do
    echo "Installing $package..."
    if yay -S --noconfirm "$package"; then
        echo "$package installed successfully."
    else
        echo "Failed to install $package."
        exit 1
    fi
done

echo "=============================="
echo "All packages installed successfully!"
echo "=============================="
