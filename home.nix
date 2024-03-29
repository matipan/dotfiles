{ config, pkgs, ... }:

{
  home.username = "matipan";
  home.homeDirectory = "/home/matipan";
  home.stateVersion = "22.05";

  # User packages
  home.packages = [
    # shell
    pkgs.zsh
    pkgs.fzf
    pkgs.tmux
    pkgs.direnv

    # tools
    pkgs.htop
    pkgs.bat
    pkgs.tree
    pkgs.neovim # for now I'll only manage the install not the config
    pkgs.jq
    pkgs.awscli2
    pkgs.libuuid

    # GUIs
    pkgs.brave

    # langs
    pkgs.go
    pkgs.gopls
    pkgs.python311
    pkgs.virtualenv
    pkgs.nodejs-18_x
    pkgs.yarn
    pkgs.coursier
    pkgs.gcc
  ];

  # Programs
  programs.home-manager.enable = true;

  programs.neovim = {
    extraConfig = ''
      lua <<EOF
        local status, ts_install = pcall(require, "nvim-treesitter.install")
        if(status) then
          ts_install.compilers = { "${pkgs.gcc}/bin/gcc" }
        end
      EOF
    '';
  };

  programs.go = {
    enable = true;
    goPath = "code/go";
    goPrivate = [ "github.com/lemonatio" ];
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = false;

    sessionVariables = {
      TERM = "xterm-256color";
      DOCKER_BUILDKIT = 1;
      GOPROXY = "https://proxy.golang.org";
      GOSUMDB = "sum.golang.org";
      GIT_EDITOR = "nvim";
      EDITOR = "nvim";
      PATH = "$PATH:$HOME/.local/bin/lua-language-server/bin:$HOME/bin/nvim-linux64/bin:$HOME/.local/bin:$HOME/lemon/lemi/bin:$HOME/.cargo/bin:$HOME/.npm-global/bin:$HOME/code/dotfiles/bin:$HOME/code/go/bin:$HOME/.npm-packages/bin:$HOME/.nube/bin";
      AWS_PROFILE = "admin";
      AWS_REGION = "sa-east-1";
      NUBE_TIENDANUBE_ROOT="/home/matipan/code/tiendanube/core";
      DOCKER_CLIENT_TIMEOUT="300";
      COMPOSE_HTTP_TIMEOUT="300";
    };

    history = {
      size = 1000000;
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
    };

    shellAliases = {
      sz = "source $HOME/.zshrc";
      c = "clear";
      k = "kubectl";
      vim = "nvim";
      vi = "nvim";
      loginaws = "aws sso login --profile admin";
      code = "code --disable-gpu";
      gw = "git worktree";
      pbcopy = ''xclip -sel "clip"'';
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "command-not-found"
      ];
      custom = "$HOME/code/dotfiles/oh-my-zsh";
      theme = "matipan";
    };

    initExtra = ''
      eval "$(direnv hook zsh)"

      aws_stg() {
        export AWS_PROFILE=stg
        export AWS_REGION=us-east-1
      }

      aws_prod() {
        export AWS_PROFILE=admin
        export AWS_REGION=us-east-1
      }

      aws_prod_legacy() {
        export AWS_PROFILE=admin
        export AWS_REGION=sa-east-1
      }

      bindkey -s ^f "tmux-sessionizer\n"
    '';
  };

  programs.tmux = {
    enable = true;

    clock24 = true;
    escapeTime = 1;
    historyLimit = 1000000;
    resizeAmount = 5;
    sensibleOnTop = true;
    prefix = "C-b";
    terminal = "xterm-256color";

    plugins = with pkgs; [
      tmuxPlugins.yank
      {
        plugin = tmuxPlugins.nord;
        extraConfig = "set -g @nord_tmux_no_patched_font '1'";
      }
    ];

    extraConfig = ''
      set -g mouse on
      set -g escape-time 1
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind o new-window -c "#{pane_current_path}"
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind m resize-pane -Z
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
      bind r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"
      bind M split-window -h "nvim ~/.tmux.conf"
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Manual stuff
  manual.manpages.enable = false;
}
