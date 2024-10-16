#!/bin/bash

# Log file for installation
LOGFILE="$HOME/nexus_install.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Check if the script is run with root privileges
if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script as root (using sudo)."
    exit 1
fi

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
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

# Function to install packages based on the detected distro
install_packages() {
    local distro="$1"
    
    echo "Detected Distro: $distro"
    case "$distro" in
        arch|manjaro)
            if [[ ! -x "$HOME/Nexus/Install/.install_arch.sh" ]]; then
                echo "Arch installation script not found or not executable."
                exit 1
            fi
            if ! "$HOME/Nexus/Install/.install_arch.sh"; then
                echo "Error installing Arch/Manjaro packages."
                exit 1
            fi
            ;;
        fedora)
            if [[ ! -x "$HOME/Nexus/Install/.install_fedora.sh" ]]; then
                echo "Fedora installation script not found or not executable."
                exit 1
            fi
            if ! "$HOME/Nexus/Install/.install_fedora.sh"; then
                echo "Error installing Fedora packages."
                exit 1
            fi
            ;;
        nixos)
            if [[ ! -x "$HOME/Nexus/Install/.install_nixos.sh" ]]; then
                echo "NixOS installation script not found or not executable."
                exit 1
            fi
            if ! "$HOME/Nexus/Install/.install_nixos.sh"; then
                echo "Error installing NixOS packages."
                exit 1
            fi
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
    if [[ ! -x "$HOME/Nexus/Install/setup_config.sh" ]]; then
        echo "Configuration setup script not found or not executable."
        exit 1
    fi
    if ! "$HOME/Nexus/Install/setup_config.sh"; then
        echo "Error setting up configuration files."
        exit 1
    fi
}

# Function to prompt for system reboot
prompt_reboot() {
    read -p "Do you want to reboot the system now? (y/n): " confirmation
    confirmation=${confirmation,,}  # Convert to lowercase
    if [[ "$confirmation" == "y" ]]; then
        echo "Rebooting the system..."
        sudo reboot
    else
        echo "You can reboot the system later."
    fi
}

# Main installer logic
main() {
    welcome_message
    distro=$(detect_distro)

    # Ask user for confirmation before proceeding
    read -p "Do you want to proceed with the Nexus installation? (y/n): " confirmation
    confirmation=${confirmation,,}  # Convert to lowercase
    if [[ "$confirmation" != "y" ]]; then
        echo "Installation cancelled."
        exit 0
    fi

    install_packages "$distro"
    setup_configuration

    echo "=============================="
    echo "Nexus installation completed successfully!"
    echo "=============================="

    # Call the reboot prompt function
    prompt_reboot
}

# Run the main function
main
