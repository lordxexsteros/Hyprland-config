#!/bin/bash

LOGFILE="setup_config.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "=============================="
echo "Setting up configuration files..."
echo "=============================="

# Create necessary directories with home path expansion
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
    ["config/hypr/hyprland.conf"]="$HOME/.config/hypr/hyprland.conf"
    ["config/hypr/component/waybar/config"]="$HOME/.config/hypr/component/waybar/config"
    ["config/hypr/component/waybar/style.css"]="$HOME/.config/hypr/component/waybar/style.css"
    ["config/hypr/conf"]="$HOME/.config/hypr/conf/"
    ["config/hypr/scripts"]="$HOME/.config/hypr/scripts/"
    ["config/hypr/store"]="$HOME/.config/hypr/store/"
    ["config/hypr/wallpapers"]="$HOME/.config/hypr/wallpapers/"
    ["config/dunst/dunstrc"]="$HOME/.config/dunst/dunstrc"
    ["config/cava/config"]="$HOME/.config/cava/config"
    ["config/wofi"]="$HOME/.config/wofi/"
)

for src in "${!config_paths[@]}"; do
    dest="${config_paths[$src]}"
    if [[ -d $src ]]; then
        cp -r "$src/"* "$dest" || { echo "Failed to copy from $src to $dest"; exit 1; }
        # Remove only if the source directory is not empty
        if [ "$(ls -A $src)" ]; then
            rm -rf "$src/*"
        fi
    else
        cp "$src" "$dest" || { echo "Failed to copy $src to $dest"; exit 1; }
        rm -f "$src" || { echo "Failed to remove $src"; exit 1; }
    fi
done

# Set executable permission for scripts
chmod +x "$HOME/.config/hypr/scripts/"* || { echo "Failed to set executable permissions."; exit 1; }

echo "=============================="
echo "Configuration setup complete!"
echo "=============================="
