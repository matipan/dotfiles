#!/bin/sh

echo "Installing base dependencies"
sudo pacman -Sy --noconfirm font-manager git base-devel wofi ttf-jetbrains-mono-nerd ttf-font-awesome pavucontrol xclip bluez bluez-utils blueman 

# setup way
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "Installing developer tools"
sudo pacman -Sy --noconfirm direnv stow tmux docker neovim zsh thefuck zoxide ripgrep

echo "Installing languages"
sudo pacman -Sy --noconfirm go zig rust python
yay -Sy --noconfirm nvm

echo "Installing common desktop applications"
yay -Sy --noconfirm zen-browser-bin zoom vesktop 1password 1password-cli wofi-wifi-menu-git wofi-emoji wezterm-git shutter-git

echo "Setting up developer tools"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# setup tpm to then install tmux plugins manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir code
cd code
git clone https://github.com/matipan/dotfiles

echo "Setting up DE"
