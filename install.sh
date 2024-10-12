#!/bin/bash

# Function to display a welcome message
welcome_message() {
    cat << "EOF"
==============================
   _   _                       _____           _        _ _            
  | \ | |                     |_   _|         | |      | | |           
  |  \| | _____  ___   _ ___    | |  _ __  ___| |_ __ _| | | ___ _ __  
  | . ` |/ _ \ \/ / | | / __|   | | | '_ \/ __| __/ _` | | |/ _ \ '__| 
  | |\  |  __/>  <| |_| \__ \  _| |_| | | \__ \ || (_| | | |  __/ |    
  |_| \_|\___/_/\_\__,_|___/ |_____|_| |_|___/\__\__,_|_|_|\___|_|    
==============================
This script will set up your Nexus environment and install necessary packages.
Please follow the prompts carefully.
==============================
EOF
}

# Function to detect the distro
detect_distro() {
    DISTRO=$(grep "^ID=" /etc/*-release | cut -d '=' -f 2)
    echo "$DISTRO"
}

# Function to install packages based on the detected distro
install_packages() {
    local distro="$1"
    
    echo "Detected Distro: $distro"
    case "$distro" in
        arch)
            ~/Install/.install_arch.sh
            ;;
        fedora)
            ~/Install/.install_fedora.sh
            ;;
        debian|ubuntu)
            ~/Install/.install_debian.sh
            ;;
        nixos)
            ~/Install/.install_nixos.sh
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
    echo "Setting up Nexus configuration files..."
    echo "=============================="
    ./setup_config.sh
}

# Main installer logic
main() {
    welcome_message
    distro=$(detect_distro)

    # Ask user for confirmation before proceeding
    read -p "Do you want to proceed with the Nexus installation? (y/n): " confirmation
    if [[ "$confirmation" != "y" ]]; then
        echo "Installation cancelled."
        exit 0
    fi

    install_packages "$distro"
    setup_configuration

    echo "=============================="
    echo "Nexus installation completed successfully!"
    echo "=============================="
}

# Run the main function
main
