#!/bin/bash

# Function to display a welcome message
welcome_message() {
    echo "=============================="
    echo "Welcome to the Dotfiles Installer!"
    echo "=============================="
    echo "This script will set up your dotfiles and install necessary packages."
    echo "Please follow the prompts carefully."
    echo "=============================="
}

# Function to detect the distro
detect_distro() {
    DISTRO=$(cat /etc/*-release | grep "^ID=" | cut -d '=' -f 2)
    echo "$DISTRO"
}

# Function to install packages based on the detected distro
install_packages() {
    local distro="$1"
    
    echo "Detected Distro: $distro"
    case "$distro" in
        arch)
            ~/installer/.install_arch.sh
            ;;
        fedora)
            ~/installer/.install_fedora.sh
            ;;
        debian|ubuntu)
            ~/installer/.install_debian.sh
            ;;
        nixos)
            ~/installer/.install_nixos.sh
            ;;
        *)
            echo "=============================="
            echo "Unsupported distro: $distro"
            echo "Exiting installation."
            echo "=============================="
            exit 1
            ;;
    esac
}

# Function to run the configuration setup
setup_configuration() {
    echo "=============================="
    echo "Setting up configuration files..."
    echo "=============================="
    ./setup_config.sh
}

# Main installer logic
main() {
    welcome_message
    distro=$(detect_distro)

    # Ask user for confirmation before proceeding
    read -p "Do you want to proceed with the installation? (y/n): " confirmation
    if [[ "$confirmation" != "y" ]]; then
        echo "Installation cancelled."
        exit 0
    fi

    install_packages "$distro"
    setup_configuration

    echo "=============================="
    echo "Installation completed successfully!"
    echo "=============================="
}

# Run the main function
main
