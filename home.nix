{ pkgs, ... }:

{
	programs.home-manager.enable = true;
	home.username = "khushraj";
	home.homeDirectory = "/home/khushraj";

	imports = [
		./programs/chromium.nix      # Web browser
		./programs/dunst.nix         # Notifications daemon
		./programs/fish.nix          # Shell
		./programs/git.nix           # Version control
		./programs/i3status-rust.nix # Statusbar information
		./programs/kitty.nix         # Terminal emulator
		./programs/picom.nix         # Display compositor
		./programs/rofi.nix          # Application launcher
		./programs/starship.nix      # Shell prompt
	];

	home.packages = [
#    pkgs.authy
		pkgs.etcher                  # Disk image flasher
		pkgs.bitwarden               # Password manager
		pkgs.bottom                  # Terminal-based task viewer
		pkgs.calibre                 # Ebook library
		pkgs.discord                 # Communications app
		pkgs.du-dust                 # Terminal-based storage space viewer
		pkgs.efibootmgr              # EFI boot entry manager
		pkgs.electrum                # Bitcoin wallet
		pkgs.fd                      # File finder
		pkgs.flameshot               # Screenshot tool
		pkgs.gitkraken               # Git GUI client
		pkgs.gnome.cheese            # Image viewer
		pkgs.google-chrome           # Browser
		pkgs.grex                    # Regex maker
		pkgs.handbrake               # Audio-video encoder
		pkgs.hyperfine               # Benchmarking tool
		pkgs.imagemagick             # Terminal-based photo modifier
		pkgs.insomnia                # REST client
		pkgs.jdk                     # Java development kit 
		pkgs.libreoffice             # Office suite
		pkgs.lm_sensors              # Hardware sensors. Required for i3status-rust
		pkgs.lxappearance            # GTK theme editor
		pkgs.neofetch                # Terminal-based system-info viewer
		pkgs.notion                  # Document manager / Collaboration
		pkgs.p7zip                   # Compression tool
		pkgs.procs                   # Terminal job viewer
		pkgs.qbittorrent             # Torrent client
		pkgs.ripgrep                 # File-content searcher
		pkgs.rustup                  # Rust toolchain manager
		pkgs.sd                      # stdin filterer
		pkgs.signal-desktop          # Communications app
		pkgs.simplescreenrecorder    # Screen recorder
		pkgs.slack                   # Communications app
		pkgs.speedtest-cli           # Network speed measurer
		pkgs.spotify                 # Music app
		pkgs.tealdeer                # Manual summarizer
		pkgs.teams                   # Video call app
		pkgs.teamviewer              # Remote desktop app
		pkgs.tdesktop                # Communications app
		pkgs.virtualbox              # Hardware virtualizer
#    pkgs.virtualboxExtpack
		pkgs.viu                     # Terminal image viewer
		pkgs.vlc                     # Audio/video player
		pkgs.youtube-dl              # Multimedia scraper
		pkgs.zoom                    # Video call app
	];

	# Temp
	programs.bat.enable = true; # File contents viewer
	programs.exa.enable = true; # File lister
	programs.firefox.enable = true; # Web browser
	programs.firefox.package = pkgs.firefox-devedition-bin;
	programs.gh.enable = true; # GitHub client
	programs.obs-studio.enable = true; # Advanced screen recorder
	programs.vscode.enable = true; # Code editor
	
	home.stateVersion = "21.05";
}
