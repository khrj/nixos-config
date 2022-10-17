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
		./services/syncthing.nix        # Cross-device file synchronization

		# Other
		./other/gtk.nix              # GTK Configuration
		./other/xdg.nix              # Cross-desktop group (freedesktop) - controls XDG config such as nautilus sidebar dirs
	];

	home.packages = with pkgs; [
		# Code
		apktool                 # Android package decompiler
		cargo-edit              # Rust: Cargo helper commands
		dprint                  # Code formatter
		gcc                     # Compiler
		git                     # Version control system
		gitkraken               # Git GUI client
		git-lfs                 # Git large file storage
		insomnia                # REST client
		poetry                  # Python package manager
		python3Full             # Programming language
		rustup                  # Rust toolchain installer

		# Jetbrains
		android-studio                 # Android
		jetbrains.idea-ultimate        # Java
		jetbrains.pycharm-professional # Python
		jetbrains.jdk                  # Java development kit

		# Apps
		bootstrap-studio             # Drag-and-drop bootstrap designer
		# calibre                      # Ebook library
		dbeaver                      # Database client
		electrum                     # Bitcoin wallet
		etcher                       # Disk image flasher
		fritzing                     # Hardware design tool
		google-chrome                # Browser
		handbrake                    # Audio-video encoder
		libreoffice                  # Office suite
		musescore                    # Music notation software
		obsidian                     # Note taking app
		pick-colour-picker           # Colour picker
		protonvpn-gui                # Virtual private Network
		qbittorrent                  # Torrent client
		tdesktop                     # Communications app
		vlc                          # Audio/video player
		zoom-us                      # Video call app

		# CLI Tools
		aria2                        # Parallel downloader
		b3sum                        # BLAKE3 hashing tool 
		bitwarden-cli                # Password manager CLI
		bottom                       # Terminal-based task viewer
		chntpw                       # Windows registry editor
		curl                         # Http client
		dmg2img                      # Disk image converter
		du-dust                      # Terminal-based storage space viewer
		fd                           # File finder
		ffmpeg                       # Multimedia handler
		grex                         # Regex maker
		hyperfine                    # Benchmarking tool
		imagemagick                  # Terminal-based photo modifier
		jq                           # JSON processor
		lsyncd                       # Cross-server file synchronization
		neofetch                     # Terminal-based system-info viewer
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
		libsForQt5.okular            # PDF editor
		pavucontrol                  # Audio configuration helper
		polkit_gnome                 # Policy kit agent
		shotwell                     # Image viewer
		v4l-utils                    # Video input adjuster
		vorta                        # Backup tool
		yaru-theme                   # GTK theme

		# Nix specific
		appimage-run                 # Run appimages without derivations
		comma                        # Run apps quickly without installing (nix-index + nix run)
		hydra-check                  # Check hydra for build statuses
		steam-run                    # Run binaries without derivations
	];
}
