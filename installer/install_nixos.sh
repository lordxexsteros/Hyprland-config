#!/bin/bash

echo "=============================="
echo "NixOS detected!"
echo "NixOS does not use traditional package managers like pacman, apt, or dnf."
echo "Please add the following configuration to your /etc/nixos/configuration.nix file:"
echo "=============================="
echo "
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
"
echo "After adding this, run: sudo nixos-rebuild switch"
echo "=============================="
