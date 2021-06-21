{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "khushraj";
  home.homeDirectory = "/home/khushraj";

  imports = [
    ./git.nix
    ./chromium.nix
    ./kitty.nix
    ./rofi.nix
  ];

  home.packages = [
#    pkgs.authy
    pkgs.etcher
    pkgs.bitwarden
    pkgs.bottom
    pkgs.calibre
    pkgs.discord
    pkgs.dunst
    pkgs.du-dust
    pkgs.efibootmgr
    pkgs.electrum
    pkgs.exa
    pkgs.fd
    pkgs.firefox-devedition-bin
    pkgs.flameshot
    pkgs.gh
    pkgs.gitkraken
    pkgs.google-chrome
    pkgs.grex
    pkgs.handbrake
    pkgs.hyperfine
    pkgs.i3status-rust
    pkgs.imagemagick
    pkgs.insomnia
    pkgs.jdk
    pkgs.libreoffice
    pkgs.lxappearance
    pkgs.neofetch
    pkgs.notion
    pkgs.obs-studio
    pkgs.p7zip
    pkgs.procs
    pkgs.qbittorrent
    pkgs.ripgrep
    pkgs.rustup
    pkgs.sd
    pkgs.signal-desktop
    pkgs.simplescreenrecorder
    pkgs.slack
    pkgs.speedtest-cli
    pkgs.spotify
    pkgs.starship
    pkgs.tealdeer
    pkgs.teams
    pkgs.teamviewer
    pkgs.tdesktop
    pkgs.virtualbox
#    pkgs.virtualboxExtpack
    pkgs.vscode
    pkgs.viu
    pkgs.vlc
    pkgs.youtube-dl
    pkgs.zoom
    pkgs.zsh
  ];

  # Temp
  programs.bat.enable = true;
  # programs.cheese.enable = true;
  
  home.stateVersion = "21.05";
}
