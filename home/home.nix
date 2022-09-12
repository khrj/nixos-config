{ pkgs, lib, inputs, stable, unstable-small, lagging, ... }:

{
	programs.home-manager.enable = true;

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
		./programs/starship.nix      # Shell prompt
		./programs/vscode.nix        # Code editor

		# Services
		./services/configure-camera.nix # Configures camera on startup
		./services/flameshot.nix        # Screenshot tool
		./services/polkit.nix           # Policy kit graphical agent
		./services/rclone.nix           # Cloud sync daemon

		# Other
		./other/gtk.nix              # GTK Configuration
		./other/xdg.nix              # Cross-desktop group (freedesktop) - controls XDG config such as nautilus sidebar dirs
	];

	home.packages = with pkgs; [
		# Code
		cargo-edit              # Rust: Cargo helper commands
		dprint                  # Code formatter - Installed globally for one-off uses
		gcc                     # Compiler
		gh                      # GitHub client
		git                     # Version Control System
		gitkraken               # Git GUI client
		git-lfs                 # Git Large File Storage
		insomnia                # REST client
		poetry                  # Python Package Manager
		python3Full             # Programming language
		rustup                  # Rust toolchain installer
		vim                     # Advanced text editor

		# Jetbrains
		android-studio                 # Android
		jetbrains.idea-ultimate        # Java
		lagging.jetbrains.pycharm-professional # Python
		jetbrains.jdk                  # Java Development Kit

		# Apps
		anki                         # Flashcards
		bootstrap-studio             # Drag-and-drop bootstrap designer
		betterdiscordctl             # Discord enhancer
		calibre                      # Ebook library
		dbeaver                      # Database client
		discord                      # Communications app
		electrum                     # Bitcoin wallet
		etcher                       # Disk image flasher
		fritzing                     # Hardware design tool
		google-chrome                # Browser
		handbrake                    # Audio-video encoder
		libreoffice                  # Office suite
		obsidian                     # Document organiser
		pick-colour-picker           # Colour picker
		protonvpn-gui                # Virtual Private Network
		qbittorrent                  # Torrent client
		realvnc-vnc-viewer           # Remote desktop app
		tdesktop                     # Communications app
		teamviewer                   # Remote desktop app
		vlc                          # Audio/video player
		zoom-us                      # Video call app

		# CLI Tools
		appimage-run                 # Run appimages without derivations
		aria2                        # Parallel downloader
		b3sum                        # BLAKE3 hashing tool 
		bitwarden-cli                # Password manager CLI
		bottom                       # Terminal-based task viewer
		chntpw                       # Windows registry editor
		comma                        # Run apps quickly without installing (nix-index + nix run)
		curl                         # Http client
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
		rclone                       # Cloud sync tool
		ripgrep                      # File-content searcher
		sd                           # stdin filterer
		speedtest-cli                # Network speed measurer
		tealdeer                     # Manual summarizer
		unzip                        # File unzipper
		viu                          # Terminal image viewer
		websocat                     # WebSocket client
		wget                         # File downloader
		yt-dlp                       # Multimedia scraper
		zip                          # File zipper

		# System
		efibootmgr                   # EFI boot entry manager
		gnome.nautilus-python        # Nautilus extension API
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
}
