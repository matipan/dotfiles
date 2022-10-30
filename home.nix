{ config, pkgs, ... }:

{
  home.username = "matipan";
  home.homeDirectory = "/home/matipan";
  home.stateVersion = "22.05";

  # User packages
  home.packages = [
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

  # Manual stuff
  manual.manpages.enable = false;
}
