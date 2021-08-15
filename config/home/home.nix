{ pkgs, stable, lib, config, ... }:

{
	programs.home-manager.enable = true;
	home = {
		username = "khushraj";
		homeDirectory = "/home/khushraj";
	};

	imports = [
		# Programs
		./programs/bat.nix           # File contents viewer
		./programs/direnv.nix        # Automatic flake loader
		./programs/exa.nix           # File lister
		./programs/firefox.nix       # Web browser
		./programs/fish.nix          # Shell
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
		./services/picom.nix         # Display compositor
		./services/polkit.nix        # Policy kit graphical agent
		./services/rclone.nix        # Cloud sync daemon

		# Other
		./other/fonts.nix            # Fonts
		./other/gtk.nix              # GTK Configuration
		./other/i3.nix               # Window manager
		./other/xdg.nix              # Cross-desktop group (freedesktop) - controls XDG config such as nautilus sidebar dirs
	];

	# TODO 
	# Add: android-sdk-platform-tools, bootstrap-studio,
	# prisma-studio, run-js, notion, howdy
	home.packages = with pkgs; [
		# Two-factor authentication app
		(authy.overrideAttrs (oa: { meta = oa.meta // { priority = 6; }; }))
		b3sum                   # BLAKE3 hashing tool 
		bitwarden               # Password manager
		bitwarden-cli           # Password manager CLI
		bottom                  # Terminal-based task viewer
		calibre                 # Ebook library
		cargo-edit              # Rust: Cargo helper commands
		deja-dup                # Backup tool
		discord                 # Communications app
		dmg2img                 # Disk image converter
		dprint                  # Code formatter - Installed globally for one-off uses
		du-dust                 # Terminal-based storage space viewer
		efibootmgr              # EFI boot entry manager
		electrum                # Bitcoin wallet
		element-desktop         # Matrix Chat Client
		etcher                  # Disk image flasher
		fd                      # File finder
		fritzing                # Hardware design tool
		gcc                     # Compiler
		gh                      # GitHub client
		gimp                    # Image editor
		gitkraken               # Git GUI client
		gnome.cheese            # Camera application
		gnome.gnome-font-viewer # Font viewer
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
		jetbrains.idea-ultimate # Integrated Development Environment
		jetbrains.jdk           # Java Development Kit
		libreoffice             # Office suite
		lm_sensors              # Hardware sensors. Required for i3status-rust
		mailspring              # Email client
		# mysql-workbench         # Database query tool
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
		recapp                  # Screen Recorder
		ripgrep                 # File-content searcher
		sd                      # stdin filterer
		signal-desktop          # Communications app
		slack                   # Communications app
		speedtest-cli           # Network speed measurer
		spotify                 # Music app
		tdesktop                # Communications app
		tealdeer                # Manual summarizer
		teams                   # Video call app
		teamviewer              # Remote desktop app
		unzip                   # File unzipper
		v4l-utils               # Video input adjuster
		vim                     # Advanced text editor
		viu                     # Terminal image viewer
		vlc                     # Audio/video player
		wget                    # File downloader
		yaru-theme              # GTK Theme
		youtube-dl              # Multimedia scraper
		zoom-us                 # Video call app
	];

	home.stateVersion = "21.05";
}
