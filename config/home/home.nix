{ pkgs, unstable-small, stable, lib, config, ... }:

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
		./programs/go.nix            # Golang
		./programs/kitty.nix         # Terminal emulator
		./programs/nix-index.nix     # command-not-found replacement
		./programs/obs-studio.nix    # Advanced screen recorder
		./programs/starship.nix      # Shell prompt
		./programs/vscode.nix        # Code editor

		# Services
		./services/flameshot.nix     # Screenshot tool
		./services/polkit.nix        # Policy kit graphical agent
		./services/rclone.nix        # Cloud sync daemon

		# Other
		./other/fonts.nix            # Fonts
		./other/gtk.nix              # GTK Configuration
		./other/xdg.nix              # Cross-desktop group (freedesktop) - controls XDG config such as nautilus sidebar dirs
	];

	# TODO Add: bootstrap-studio, howdy
	home.packages = with pkgs; [
		# Code
		cargo-edit              # Rust: Cargo helper commands
		dprint                  # Code formatter - Installed globally for one-off uses
		gcc                     # Compiler
		gh                      # GitHub client
		gitkraken               # Git GUI client
		git-lfs                 # Git Large File Storage
		insomnia                # REST client
		rustup                  # Rust toolchain installer
		vim                     # Advanced text editor

		# Jetbrains
		android-studio                 # Android
		jetbrains.idea-ultimate        # Java
		jetbrains.pycharm-professional # Python
		# jetbrains.clion                # Rust
		jetbrains.goland               # Go
		jetbrains.webstorm             # JS/TS + HTML/CSS
		jetbrains.datagrip             # SQL
		jetbrains.jdk                  # Java Development Kit

		# Apps
		(authy.overrideAttrs 
			(oa: { meta = oa.meta // { priority = 6; }; })
		)                            # Two-factor authentication app
		betterdiscordctl             # Discord enhancer
		bitwarden                    # Password manager
		unstable-small.calibre       # Ebook library
		discord                      # Communications app
		electrum                     # Bitcoin wallet
		element-desktop              # Matrix Chat Client
		etcher                       # Disk image flasher
		fritzing                     # Hardware design tool
		gimp                         # Image editor
		google-chrome                # Browser
		handbrake                    # Audio-video encoder
		libreoffice                  # Office suite
		stable.mysql-workbench       # Database query tool
		obsidian                     # Document organiser
		pick-colour-picker           # Colour picker
		qbittorrent                  # Torrent client
		realvnc-vnc-viewer           # Remote desktop app
		signal-desktop               # Communications app
		slack                        # Communications app
		spotify                      # Music app
		tdesktop                     # Communications app
		teams                        # Video call app
		teamviewer                   # Remote desktop app
		vlc                          # Audio/video player
		zoom-us                      # Video call app

		# CLI Tools
		b3sum                        # BLAKE3 hashing tool 
		bitwarden-cli                # Password manager CLI
		bottom                       # Terminal-based task viewer
		comma                        # Run apps quickly without installing (nix-index + nix run)
		dmg2img                      # Disk image converter
		du-dust                      # Terminal-based storage space viewer
		fd                           # File finder
		ffmpeg                       # Multimedia handler
		grex                         # Regex maker
		hyperfine                    # Benchmarking tool
		imagemagick                  # Terminal-based photo modifier
		jq                           # JSON processor
		neofetch                     # Terminal-based system-info viewer
		ngrok                        # Localhost proxy-tunnel
		p7zip                        # Compression tool
		procs                        # Terminal job viewer
		protonvpn-cli                # Virtual Private Network
		rclone                       # Cloud sync tool
		ripgrep                      # File-content searcher
		sd                           # stdin filterer
		speedtest-cli                # Network speed measurer
		tealdeer                     # Manual summarizer
		unzip                        # File unzipper
		viu                          # Terminal image viewer
		websocat                     # WebSocket client
		wget                         # File downloader
		youtube-dl                   # Multimedia scraper
		zip                          # File zipper

		# System
		efibootmgr                   # EFI boot entry manager
		gparted                      # Partition manager
		hsetroot                     # Wallpaper setter
		libsForQt5.okular            # PDF Editor
		lm_sensors                   # Hardware sensors. Required for i3status-rust
		pavucontrol                  # Audio configuration helper
		polkit_gnome                 # Policy Kit Agent
		shotwell                     # Image viewer
		v4l-utils                    # Video input adjuster
		vorta                        # Backup tool
		yaru-theme                   # GTK Theme
	];

	home.stateVersion = "21.05";
}
