#!/bin/bash

# ##################################################################
#               Arch Linux Package Installation Script             #
# ##################################################################
#
#  Define the packages you want to install in the 'packages' list.
#  The script will then use 'yay' to install them.
#

# --- EDIT THIS LIST ---
# Add your desired packages here, separated by a new line.
# I've added some common examples from official repos and the AUR.
packages=(
    #-----Browser----#
    'librewolf-bin'
    #-----Office-----#
    'libreoffice-fresh'
    #-----Download Manager-----#
    'ab-download-manager'
    #-----Torrent Client-----#
    'qbittorrent'
    #-----Messaging App-----#
    'discord'
    #-----Virtual Machine Manager-----#
    'virt-manager'
    'qemu-full'
    'libvirt'
    'dnsmasq'
    #-----DNSCrypt-Proxy-----#
    'dnscrypt-proxy'
    #-----Flatpak-----#
    'flatpak'
    #-----Code Editor-----#
    'vscodium'
    #-----Games Launcher-----#
    'heroic-games-launcher-bin'
    'steam'
    #-----Video Editor-----#
    'kdenlive'
    #-----Media Player-----#
    'vlc'
    #----Video Recording Tool-----#
    'obs-studio'
    #----Cleaner----#
    'bleachbit'
    #----App Store----#
    'gnome-software'
)

# --- SCRIPT LOGIC (No need to edit below this line) ---

# 1. Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "❌ Error: yay is not installed."
    echo "Please install yay to continue. See: https://github.com/Jguer/yay"
    exit 1
fi

# 2. Update system package databases and upgrade installed packages
echo "🔄 Synchronizing package databases and updating system..."
yay -Syu --noconfirm

# 3. Install the packages from the list
echo "📦 Installing specified packages..."
# The --needed flag prevents reinstalling packages that are already up-to-date.
yay -S --needed "${packages[@]}"

# 4. Final message
echo ""
echo "✅ Script finished! All specified packages have been processed."
