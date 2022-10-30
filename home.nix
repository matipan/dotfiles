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

    # tools
    pkgs.htop
    pkgs.git
    pkgs.bat
    pkgs.tree

    # langs
    pkgs.go
    pkgs.gopls
  ];

  # Programs
  programs.home-manager.enable = true;

  programs.go = {
    enable = true;
    goPath = "code/go";
    goPrivate = [ "github.com/lemonatio" ];
  };

  programs.git = {
    enable = true;
    userName = "Matias Pan";
    userEmail = "matipan@hey.com";
    extraConfig = {
      color.ui = true;
      gihub.user = "matipan";
      init.defaultBranch = "main";
    };
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
      PATH = "$PATH:$HOME/bin/nvim-linux64/bin:$HOME/.local/bin:$HOME/lemon/lemi/bin:$HOME/.cargo/bin:$HOME/.npm-global/bin";
      AWS_PROFILE = "admin";
      AWS_REGION = "sa-east-1";
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

      aws_prod_legacy() {
        export AWS_PROFILE=admin
        export AWS_REGION=us-east-1
      }

      aws_prod_legacy() {
        export AWS_PROFILE=admin
        export AWS_REGION=sa-east-1
      }

      tmux_sessionizer() {
        if [[ $# -eq 1 ]]; then
            selected=$1
        else
            selected=$(find ~/code ~/lemon ~/ -mindepth 1 -maxdepth 1 -type d | fzf)
        fi

        if [[ -z $selected ]]; then
            exit 0
        fi

        selected_name=$(basename "$selected" | tr . _)
        tmux_running=$(pgrep tmux)

        if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
            tmux new-session -s $selected_name -c $selected
            exit 0
        fi

        if ! tmux has-session -t=$selected_name 2> /dev/null; then
            tmux new-session -ds $selected_name -c $selected
        fi

        if [[ -z $TMUX ]] && [[ ! -z $tmux_running ]]; then
            tmux attach -t $selected_name
            exit 0
        fi

        tmux switch-client -t $selected_name
      }

      bindkey -s ^f "tmux_sessionizer\n"
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Manual stuff
  manual.manpages.enable = false;
}
