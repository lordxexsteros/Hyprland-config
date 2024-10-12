#!/bin/bash

LOGFILE="setup_config.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=============================="
echo "Setting up configuration files..."
echo "=============================="

# Create necessary directories
declare -a directories=(
    "~/.config/hypr/component/waybar"
    "~/.config/hypr/conf"
    "~/.config/hypr/scripts/tools"
    "~/.config/hypr/store"
    "~/.config/hypr/wallpapers"
    "~/.config/dunst"
    "~/.config/cava"
    "~/.config/wofi"
)

for dir in "${directories[@]}"; do
    mkdir -p "$dir" || { echo "Failed to create directory: $dir"; exit 1; }
done

# Copy configuration files to respective directories
echo "=============================="
echo "Copying configuration files..."
echo "=============================="

# Use associative arrays for source and destination paths
declare -A config_paths=(
    ["config/hypr/hyprpaper"]="~/.config/hypr/hyprpaper"
    ["config/hypr/hyprland.conf"]="~/.config/hypr/hyprland.conf"
    ["config/hypr/component/waybar/config"]="~/.config/hypr/component/waybar/config"
    ["config/hypr/component/waybar/style.css"]="~/.config/hypr/component/waybar/style.css"
    ["config/hypr/conf"]="~/.config/hypr/conf/"
    ["config/hypr/scripts"]="~/.config/hypr/scripts/"
    ["config/hypr/store"]="~/.config/hypr/store/"
    ["config/hypr/wallpapers"]="~/.config/hypr/wallpapers/"
    ["config/dunst/dunstrc"]="~/.config/dunst/dunstrc"
    ["config/cava/config"]="~/.config/cava/config"
    ["config/wofi"]="~/.config/wofi/"
)

for src in "${!config_paths[@]}"; do
    dest="${config_paths[$src]}"
    if [[ -d $src ]]; then
        cp -r "$src"/* "$dest" || { echo "Failed to copy from $src to $dest"; exit 1; }
        rm -rf "$src/*"
    else
        cp "$src" "$dest" || { echo "Failed to copy $src to $dest"; exit 1; }
        rm -rf "$src"
    fi
done

# Set executable permission for scripts
chmod +x ~/.config/hypr/scripts/* || { echo "Failed to set executable permissions."; exit 1; }

echo "=============================="
echo "Configuration setup complete!"
echo "=============================="
