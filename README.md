# Nix setup and config files

This repo holds my dotfiles and most recently my nix setup to use with home-manager.

For now I'm keeping all my "old" dotfiles (such as .zshrc and .tmux.conf) just in case. But I'm making an effort to migrate everything over to home-manager. There are a few quite opionionated things in home-manager's programs that I don't particularly like. But I can avoid those and simply configure it myself like I do with neovim.

## Setup Nix
To install Nix I simply followed [this guide](https://nixos.org/download.html) and used the multi-user installation.

## Setup home-manager
Home-manager was installed following [this guide](https://nix-community.github.io/home-manager/index.html#sec-install-standalone). I installed based on nixpkgs 22.05.

Once installed you can simply:
```sh
$ home-manager switch -f home.nix
```

## Setup neovim
After installing neovim with home-manager you have to manually configure it. First install [vim-plug](https://github.com/junegunn/vim-plug):
```sh
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then simply create a symlink to the entire nvim folder:
```sh
$ ln -s nvim ~/.config/nvim
```

Open nvim and run `:PlugInstall` to install all plugins.
