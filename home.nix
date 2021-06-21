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
    pkgs.fd
    pkgs.flameshot
    pkgs.gitkraken
    pkgs.google-chrome
    pkgs.grex
    pkgs.handbrake
    pkgs.hyperfine
    pkgs.imagemagick
    pkgs.insomnia
    pkgs.jdk
    pkgs.libreoffice
    pkgs.lxappearance
    pkgs.neofetch
    pkgs.notion
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
    pkgs.tealdeer
    pkgs.teams
    pkgs.teamviewer
    pkgs.tdesktop
    pkgs.virtualbox
#    pkgs.virtualboxExtpack
    pkgs.viu
    pkgs.vlc
    pkgs.youtube-dl
    pkgs.zoom
  ];

  # Temp
  programs.bat.enable = true;
  programs.exa.enable = true;
  programs.firefox.enable = true;
  programs.firefox.package = pkgs.firefox-devedition-bin;
  programs.gh.enable = true;
  programs.i3status-rust.enable = true;
  programs.obs-studio.enable = true;
  programs.starship.enable = true;
  programs.vscode.enable = true;
  programs.zsh.enable = true;
  # programs.cheese.enable = true;
  
  home.stateVersion = "21.05";
}
