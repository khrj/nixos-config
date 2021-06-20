{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "khushraj";
  home.homeDirectory = "/home/khushraj";
  
  home.packages = [
    pkgs.rofi
  ];

  imports = [
    ./git.nix
    ./chromium.nix
    ./kitty.nix
  ];

  home.stateVersion = "21.05";
}
