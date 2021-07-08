{ pkgs, lib, config, ... }:

let
	unstable = import
		(builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/nixos-unstable)
		{ config = config.nixpkgs.config; };
in

{
	programs.home-manager.enable = true;
	home.username = "khushraj";
	home.homeDirectory = "/home/khushraj";
	
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"authy"
		"discord"
		"firefox-devedition-bin" "firefox-devedition-bin-unwrapped"
		"gitkraken"
		"google-chrome"
		"ngrok"
		"obsidian"
		"slack"
		"spotify" "spotify-unwrapped"
		"teams"
		"teamviewer"
		"vscode"
		"zoom"
	];

	imports = [
		# Programs
		./programs/bat.nix           # File contents viewer
		./programs/chromium.nix      # Web browser
		./programs/exa.nix           # File lister
		./programs/firefox.nix       # Web browser
		./programs/fish.nix          # Shell
		./programs/gh.nix            # GitHub client
		./programs/git.nix           # Version control
		./programs/i3status-rust.nix # Statusbar information
		./programs/kitty.nix         # Terminal emulator
		./programs/obs-studio.nix    # Advanced screen recorder
		./programs/rofi.nix          # Application launcher
		./programs/starship.nix      # Shell prompt
		./programs/vscode.nix        # Code editor

		# Services
		./services/dunst.nix         # Notifications daemon
		./services/flameshot.nix     # Screenshot tool
		./services/gnome-keyring.nix # Keychain daemon
		./services/gpg.nix           # Encryption tool
		./services/picom.nix         # Display compositor
		./services/polkit.nix        # Policy kit graphical agent

		# Other
		./other/fonts.nix            # Fonts
		./other/gtk.nix              # GTK Configuration
		./other/x.nix                # Display protocol
		./other/cache.nix            # Declarative nix cache
	];

	# TODO
	# - Fix: chromium-widevine
	# - Add: android-sdk-platform-tools, bootstrap-studio, docker,
	#   docker-compose, howdy, polkit, prisma-studio, run-js, notion
	# - Make: grub-silent, possibly with plymouth (?)
	home.packages = with pkgs; [
		# Two-factor authentication app
		(authy.overrideAttrs (oa: { meta = oa.meta // { priority = 6; }; }))
		etcher                  # Disk image flasher
		b3sum                   # BLAKE3 hashing tool 
		bitwarden               # Password manager
		bottom                  # Terminal-based task viewer
		calibre                 # Ebook library
		discord                 # Communications app
		unstable.dprint         # Code formatter - Installed globally for one-off uses
		du-dust                 # Terminal-based storage space viewer
		efibootmgr              # EFI boot entry manager
		electrum                # Bitcoin wallet
		element-desktop         # Matrix Chat Client
		fd                      # File finder
		gcc                     # Compiler
		gimp                    # Image editor
		gitkraken               # Git GUI client
		gnome.cheese            # Camera application
		gnome.gnome-font-viewer # Font viewer
		gnome.geary             # Email client
		gnome.nautilus          # File system explorer
		gnome.seahorse          # Keychain viewer
		google-chrome           # Browser
		gparted                 # Partition manager
		grex                    # Regex maker
		handbrake               # Audio-video encoder
		hsetroot                # Wallpaper setter
		hyperfine               # Benchmarking tool
		imagemagick             # Terminal-based photo modifier
		insomnia                # REST client
		jdk                     # Java development kit 
		libreoffice             # Office suite
		lm_sensors              # Hardware sensors. Required for i3status-rust
		neofetch                # Terminal-based system-info viewer
		ngrok                   # Localhost proxy-tunnel
		obsidian                # Document organiser
		p7zip                   # Compression tool
		pavucontrol             # Audio configuration helper
		polkit_gnome            # Policy Kit Agent
		procs                   # Terminal job viewer
		protonvpn-cli           # Virtual Private Network
		qbittorrent             # Torrent client
		rclone                  # Cloud sync tool
		ripgrep                 # File-content searcher
		rustup                  # Rust toolchain manager
		sd                      # stdin filterer
		signal-desktop          # Communications app
		simplescreenrecorder    # Screen recorder
		slack                   # Communications app
		speedtest-cli           # Network speed measurer
		spotify                 # Music app
		tdesktop                # Communications app
		tealdeer                # Manual summarizer
		teams                   # Video call app
		teamviewer              # Remote desktop app
		viu                     # Terminal image viewer
		vlc                     # Audio/video player
		yaru-theme              # GTK Theme
		youtube-dl              # Multimedia scraper
		zoom-us                 # Video call app
	];

	home.stateVersion = "21.05";
}
