#!/bin/bash

echo "=============================="
echo "Setting up configuration files..."
echo "=============================="

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

cp -r config/hypr/component/waybar/config ~/.config/hypr/component/waybar/
cp -r config/hypr/component/waybar/style.css ~/.config/hypr/component/waybar/
cp -r config/hypr/conf/* ~/.config/hypr/conf/
cp -r config/hypr/scripts/* ~/.config/hypr/scripts/
cp -r config/hypr/store/* ~/.config/hypr/store/
cp -r config/hypr/wallpapers/* ~/.config/hypr/wallpapers/

cp -r config/dunst/dunstrc ~/.config/dunst/
cp -r config/cava/config ~/.config/cava/
cp -r config/wofi/* ~/.config/wofi/

# Set executable permission for scripts
chmod +x ~/.config/hypr/scripts/*

echo "=============================="
echo "Configuration setup complete!"
echo "=============================="
