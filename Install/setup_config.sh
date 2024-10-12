#!/bin/bash

echo "=============================="
echo "Setting up configuration files..."
echo "=============================="

# Create necessary directories
mkdir -p ~/.config/hypr/component/waybar
mkdir -p ~/.config/hypr/conf
mkdir -p ~/.config/hypr/scripts/tools
mkdir -p ~/.config/hypr/store
mkdir -p ~/.config/hypr/wallpapers
mkdir -p ~/.config/dunst
mkdir -p ~/.config/cava
mkdir -p ~/.config/wofi

# Copy configuration files to respective directories
echo "=============================="
echo "Copying configuration files..."
echo "=============================="

cp -r config/hypr/hyprpaper ~/.config/hypr/
rm -rf config/hypr/hyprpaper # Delete after copying

cp -r config/hypr/hyprland.conf ~/.config/hypr/
rm -rf config/hypr/hyprland.conf # Delete after copying

cp -r config/hypr/component/waybar/config ~/.config/hypr/component/waybar/
rm -rf config/hypr/component/waybar/config # Delete after copying

cp -r config/hypr/component/waybar/style.css ~/.config/hypr/component/waybar/
rm -rf config/hypr/component/waybar/style.css # Delete after copying

cp -r config/hypr/conf/* ~/.config/hypr/conf/
rm -rf config/hypr/conf/* # Delete after copying

cp -r config/hypr/scripts/* ~/.config/hypr/scripts/
rm -rf config/hypr/scripts/* # Delete after copying

cp -r config/hypr/store/* ~/.config/hypr/store/
rm -rf config/hypr/store/* # Delete after copying

cp -r config/hypr/wallpapers/* ~/.config/hypr/wallpapers/
rm -rf config/hypr/wallpapers/* # Delete after copying

cp -r config/dunst/dunstrc ~/.config/dunst/
rm -rf config/dunst/dunstrc # Delete after copying

cp -r config/cava/config ~/.config/cava/
rm -rf config/cava/config # Delete after copying

cp -r config/wofi/* ~/.config/wofi/
rm -rf config/wofi/* # Delete after copying

# Set executable permission for scripts
chmod +x ~/.config/hypr/scripts/*

echo "=============================="
echo "configuration setup complete!"
echo "=============================="
