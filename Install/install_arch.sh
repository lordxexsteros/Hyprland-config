#!/bin/bash

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
packages=("hyprland" "dunst" "cava" "wofi" "waybar" "swww")
for package in "${packages[@]}"; do
    echo "Installing $package..."
    if sudo pacman -S --noconfirm "$package"; then
        echo "$package installed successfully."
    else
        echo "Failed to install $package."
    fi
done
