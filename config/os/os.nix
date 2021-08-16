{ pkgs, stable, config, lib, ... }:

{	
	imports = [
		# Components
		./components/accounts.nix
		./components/bluetooth.nix
		./components/boot.nix
		./components/display.nix
		./components/file-system.nix
		./components/network.nix
		./components/printing.nix
		./components/sound.nix
		./components/time.nix

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
		trustedUsers = [ "khushraj" ];
		autoOptimiseStore = true;
		package = pkgs.nixUnstable;
		extraOptions = ''
			experimental-features = nix-command flakes
			keep-outputs = true
			keep-derivations = true
		'';
	};

	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"authy"
		"code"
		"discord"
		"firefox-devedition-bin" "firefox-devedition-bin-unwrapped"
		"gitkraken"
		"google-chrome"
		"idea-ultimate"
		"ngrok"
		"obsidian"
		"Oracle_VM_VirtualBox_Extension_Pack"
		"slack"
		"spotify" "spotify-unwrapped"
		"teams"
		"teamviewer"
		"vscode"
		"vscode-extension-ms-vsliveshare-vsliveshare"
		"zoom"
	];

	system.stateVersion = "21.05"; 	# State version, do not change with OS upgrade
}
