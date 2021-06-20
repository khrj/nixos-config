{ ... }:

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

  home.stateVersion = "21.05";
}
