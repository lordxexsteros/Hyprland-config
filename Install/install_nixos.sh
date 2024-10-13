#!/bin/bash

echo "=============================="
echo "NixOS detected!"
echo "NixOS does not use traditional package managers like pacman, apt, or dnf."
echo "Please add the following configuration to your /etc/nixos/configuration.nix file:"
echo "=============================="

# Print the NixOS configuration block
cat << EOF

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland
    dunst
    cava
    wofi
    waybar
    swww # If available in Nixpkgs
  ];

  services.xserver.enable = true; # Enable X server
  services.xserver.windowManager.hyprland.enable = true; # Enable Hyprland
}
EOF

echo "=============================="
echo "After adding this, run: sudo nixos-rebuild switch"
echo "=============================="
