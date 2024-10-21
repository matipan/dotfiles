#!/bin/sh

echo "Installing base dependencies"
sudo pacman -Sy --noconfirm font-manager git base-devel wofi ttf-jetbrains-mono-nerd ttf-font-awesome pavucontrol xclip bluez bluez-utils blueman lxqt-policykit pambase pam gnome-keyring bind cliphist xorg-xhost inotify-tools waybar swaync hyprpaper

cd $HOME && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo "Installing developer tools"
yay -Sy --noconfirm direnv stow tmux docker neovim zsh thefuck zoxide ripgrep bat btop fzf github-cli kubectl aws-cli-v2 ripgrep docker-compose git-delta

echo "Installing languages"
yay -Sy --noconfirm go zig rustup python3 python-pip nvm

echo "Installing common desktop applications and utilities"
yay -Sy --noconfirm zen-browser-bin zoom vesktop 1password 1password-cli wofi-emoji wezterm-git hyprshot grim slurp swappy obsidian vlc obs-studio brave-browser timeshift timeshift-autosnap grub-btrfs wf-recorder

echo "Setting up developer tools"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# setup tpm to then install tmux plugins manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Configuring tools"
rm $HOME/matipan/.zshrc
rm $HOME/matipan/.tmux.conf
cd $HOME/matipan/dotfiles
stow zsh
stow nvim
stow tmux
stow hypr
stow wofi
stow waybar
stow wezterm
stow swaync
stow kitty
