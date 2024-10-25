#!/bin/sh

echo "Installing base dependencies"
sudo pacman -Sy --noconfirm font-manager git base-devel wofi ttf-jetbrains-mono-nerd ttf-font-awesome pavucontrol xclip bluez bluez-utils blueman lxqt-policykit pambase pam gnome-keyring bind cliphist xorg-xhost inotify-tools hyprland waybar swaync hyprpaper hyprlock less

cd $HOME && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "Installing developer tools"
yay -Sy --noconfirm direnv stow tmux docker neovim zsh thefuck zoxide ripgrep bat btop fzf github-cli kubectl aws-cli-v2 ripgrep docker-compose git-delta neofetch

echo "Installing languages"
yay -Sy --noconfirm go zig rustup python3 python-pip nvm php

echo "Installing common desktop applications and utilities"
yay -Sy --noconfirm zen-browser-bin zoom vesktop 1password 1password-cli wofi-emoji wezterm-git hyprshot grim slurp swappy obsidian vlc obs-studio brave-browser timeshift timeshift-autosnap grub-btrfs wf-recorder jq whois spotify

