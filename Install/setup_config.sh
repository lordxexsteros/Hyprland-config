#!/bin/bash

# Log file for configuration setup
LOGFILE="$HOME/setup_config.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=============================="
echo "Setting up configuration files..."
echo "=============================="

# Create necessary directories
declare -a directories=(
    "$HOME/.config/hypr/component/waybar"
    "$HOME/.config/hypr/conf"
    "$HOME/.config/hypr/scripts/tools"
    "$HOME/.config/hypr/store"
    "$HOME/.config/hypr/wallpapers"
    "$HOME/.config/dunst"
    "$HOME/.config/cava"
    "$HOME/.config/wofi"
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
    ["config/hypr/hyprpaper"]="$HOME/.config/hypr/hyprpaper"
    ["config/hypr/waybar/config"]="$HOME/.config/hypr/component/waybar/config"
    ["config/dunst/dunstrc"]="$HOME/.config/dunst/dunstrc"
    ["config/cava/config"]="$HOME/.config/cava/config"
    ["config/wofi/wofi.conf"]="$HOME/.config/wofi/wofi.conf"
)

# Loop through the config_paths and copy each file
for src in "${!config_paths[@]}"; do
    dest="${config_paths[$src]}"
    if cp "$src" "$dest"; then
        echo "Copied $src to $dest"
        # Remove the source file after copying
        rm "$src" && echo "Removed $src after copying."
    else
        echo "Failed to copy $src to $dest."
        exit 1
    fi
done

echo "=============================="
echo "Configuration setup completed successfully!"
echo "=============================="
