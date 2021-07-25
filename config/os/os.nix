{ pkgs, unstable, config, lib, ... }:

{	
	imports = [
		# Components
		./components/accounts.nix
		./components/boot.nix
		./components/network.nix
		./components/printing.nix
		./components/sound.nix
		./components/time.nix
		./components/xserver.nix
		./components/file-system.nix

		# Programs
		./components/programs/gnome-keyring.nix # Keychain daemon
		./components/programs/gpg.nix           # Encryption tool
		./components/programs/mysql.nix         # Database server
		./components/programs/postgres.nix      # Database server
		./components/programs/virtualbox.nix    # Hardware virtualizer
		./components/programs/dconf.nix         # Gnome configuration

		# Generated
		./hardware-configuration.nix
	];

	nix = {
		package = pkgs.nixUnstable;
		extraOptions = ''
			experimental-features = nix-command flakes
		'';
	};

	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"android-studio-stable"
		"authy"
		"code"
		"discord"
		"firefox-devedition-bin" "firefox-devedition-bin-unwrapped"
		"gitkraken"
		"google-chrome"
		"ngrok"
		"obsidian"
		"Oracle_VM_VirtualBox_Extension_Pack"
		"slack"
		"spotify" "spotify-unwrapped"
		"teams"
		"teamviewer"
		"vscode"
		"zoom"
	];

	nix.trustedUsers = [ "khushraj" ];
	nix.autoOptimiseStore = true;
	system.stateVersion = "21.05"; 	# State version, do not change with OS upgrade
}
