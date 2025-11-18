{ pkgs, lib, inputs, stable, unstable-small, lagging, leading, ... }:

{
	home.stateVersion = "22.05";

	imports = [
		# Programs
		./programs/alacritty.nix     # Terminal emulator
		./programs/atuin.nix         # Shell history management tool
		./programs/bat.nix           # File contents viewer
		./programs/direnv.nix        # Automatic flake loader
		./programs/eza.nix           # File lister
		./programs/firefox.nix       # Web browser
		./programs/fish.nix          # Shell
		./programs/git.nix           # Version control
		./programs/go.nix            # Golang
		./programs/micro.nix         # Text editor
		./programs/nix-index.nix     # command-not-found replacement
		./programs/ssh.nix           # Remote shell access
		./programs/starship.nix      # Shell prompt
		./programs/vscode.nix        # Code editor
		./programs/zellij.nix        # Terminal multiplexer

		# Services
		./services/configure-camera.nix # Configures camera on startup
		./services/rclone.nix           # Cloud sync daemon
		./services/unison.nix           # Bi-directional file synchronization

		# Other
		./other/xdg.nix              # Cross-desktop group (freedesktop) - controls XDG config such as nautilus sidebar dirs
		./other/android.nix          # Android SDK
	];

	home.packages = with pkgs; [
		# Code
		android-tools           # Android platform tools
		ansible                 # IT automation tool
		apktool                 # Android package decompiler
		arduino                 # Arduino CLI
		cargo-edit              # Rust: Cargo helper commands
		dbeaver-bin             # Database client
		deno                    # Programming language
		gcc                     # Compiler
		git                     # Version control system
		git-lfs                 # Git large file storage
		insomnia                # REST client
		llvm_19                 # C Compiler
		pico-sdk                # SDK for raspberry pi pico
		poetry                  # Python package manager
		nodePackages.prettier   # Code formatter
		python3                 # Programming language
		rustup                  # Rust toolchain installer
		sublime-merge           # Git GUI client
		tio                     # Serial IO for raspberry pi pico
		wasmtime                # WebAssembly runtime
		wireguard-tools         # VPN tools
		nodePackages.zx	        # JavaScript based shell scripts

		# Academics
		iverilog                # Verilog simulator
		gtkwave                 # Verilog waveform viewer

		# Jetbrains
		# android-studio                 # Android
		jetbrains.idea-community         # Java
		# jetbrains.pycharm-professional # Python
		jetbrains.jdk                    # Java development kit

		# Apps
		anki                         # Memorization tool
		bootstrap-studio             # Drag-and-drop bootstrap designer
		calibre                      # Ebook library
		ciscoPacketTracer8           # Network simulator
		flameshot                    # Screenshot tool
		fritzing                     # Hardware design tool
		google-chrome                # Browser
		graphwar                     # Math-based shooter game
		handbrake                    # Audio-video encoder
		libreoffice                  # Office suite
		logisim                      # Digital logic simulator
		obsidian                     # Note taking app
		pick-colour-picker           # Colour picker
		protonvpn-gui                # VPN client
		qbittorrent                  # Torrent client
		songrec                      # Shazam client, music recognition app
		telegram-desktop             # Communications app
		vlc                          # Audio/video player
		zoom-us                      # Video call app

		# CLI Tools
		aria2                        # Parallel downloader
		asciinema                    # CLI recording tool
		b3sum                        # BLAKE3 hashing tool 
		bitwarden-cli                # Password manager CLI
		bottom                       # Terminal-based task viewer
		chntpw                       # Windows registry editor
		curl                         # Http client
		dig                          # DNS query tool
		dmg2img                      # Disk image converter
		dust                         # Terminal-based storage space viewer
		fastfetch                    # Terminal-based system-info viewer
		fd                           # File finder
		ffmpeg                       # Multimedia handler
		frp                          # Reverse proxy
		grex                         # Regex maker
		hyperfine                    # Benchmarking tool
		imagemagick                  # Terminal-based photo modifier
		img2pdf                      # Image to PDF converter
		jq                           # JSON processor
		lsyncd                       # Cross-server file synchronization
		net-tools                    # Network diagnostic tools
		ncdc                         # Direct-connect client
		oath-toolkit                 # 2FA code generator
		p7zip                        # Compression tool
		procs                        # Terminal job viewer
		rclone                       # Cloud sync tool
		restic                       # Backups
		ripgrep                      # File-content searcher
		scrcpy                       # Android screen mirroring
		sd                           # stdin filterer
		nodePackages.serve           # Static HTTP file server
		speedtest-cli                # Network speed measurer
		tealdeer                     # Manual summarizer
		teleport_17                  # SSH client (custom protocol)
		trashy                       # Trash CLI
		unzip                        # File unzipper
		viu                          # Terminal image viewer
		websocat                     # WebSocket client
		wget                         # File downloader
		wl-clipboard                 # Wayland-based clipboard management utilities
		yt-dlp                       # Multimedia scraper
		zip                          # File zipper

		# System
		efibootmgr                   # EFI boot entry manager
		nautilus-python              # Nautilus extension API
		gparted                      # Partition manager
		hsetroot                     # Wallpaper setter
		papers                       # PDF viewer
		pavucontrol                  # Audio configuration helper
		shotwell                     # Image viewer
		v4l-utils                    # Video input adjuster
		yaru-theme                   # GTK theme

		# Nix specific
		appimage-run                 # Run appimages without derivations
		comma                        # Run apps quickly without installing (nix-index + nix run)
		hydra-check                  # Check hydra for build statuses
		steam-run                    # Run binaries without derivations
		nil                          # Nix language server
		nix-du                       # Check nix store space distribution
	];
}
