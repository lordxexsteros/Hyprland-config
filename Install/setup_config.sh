#!/bin/bash

# Enable error handling
set -e

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

# Copy configuration files from source directories
echo "=============================="
echo "Copying configuration files..."
echo "=============================="

# Define individual file and directory paths for hypr subdirectories
declare -A config_paths=(
    ["config/hypr/hyprpaper"]="$HOME/.config/hypr/hyprpaper"
    ["config/hypr/component/waybar/config"]="$HOME/.config/hypr/component/waybar/config"
    ["config/hypr/wallpapers"]="$HOME/.config/hypr/wallpapers"
    ["config/hypr/store"]="$HOME/.config/hypr/store"
    ["config/hypr/scripts/tools"]="$HOME/.config/hypr/scripts/tools"
    ["config/hypr/conf"]="$HOME/.config/hypr/conf"
    ["config/dunst/dunstrc"]="$HOME/.config/dunst/dunstrc"
    ["config/cava/config"]="$HOME/.config/cava/config"
    ["config/wofi/wofi.conf"]="$HOME/.config/wofi/wofi.conf"
)

# Loop through the config_paths and copy each file or directory to its destination
for src in "${!config_paths[@]}"; do
    dest="${config_paths[$src]}"
    if [[ -e "$src" ]]; then  # Check if the source file or directory exists
        if cp -r "$src" "$dest"; then
            echo "Copied $src to $dest"
        else
            echo "Failed to copy $src to $dest."
            exit 1
        fi
    else
        echo "Source file or directory $src does not exist."
    fi
done

echo "=============================="
echo "Configuration setup completed successfully!"
echo "=============================="
