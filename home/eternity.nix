{ pkgs, ... }:

{
	home.stateVersion = "23.05";
	programs.home-manager.enable = true;

	imports = [
		# Programs
		./programs/atuin.nix         # Shell history management tool
		./programs/bat.nix           # File contents viewer
		./programs/direnv.nix        # Automatic flake loader
		./programs/eza.nix           # File lister
		./programs/fish.nix          # Shell
		./programs/ssh.nix           # Remote shell access
		./programs/starship.nix      # Shell prompt
	];

	home.packages = with pkgs; [
		# Code
		git                     # Version control system
		git-lfs                 # Git large file storage
		poetry                  # Python package manager
		python3Full             # Programming language

		# CLI Tools
		curl                         # Http client
		du-dust                      # Terminal-based storage space viewer
		frp                          # Reverse proxy
		neofetch                     # Terminal-based system-info viewer
		tealdeer                     # Manual summarizer
		wget                         # File downloader
	];
}
