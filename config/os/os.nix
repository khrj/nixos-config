{ pkgs, stable, nixpkgs-ref, config, lib, ... }:

{	
	imports = [
		# Components
		./components/accounts.nix
		./components/auto-upgrade.nix
		./components/bluetooth.nix
		./components/boot.nix
		./components/display.nix
		./components/file-system.nix
		./components/gnome.nix
		./components/hardware.nix
		./components/network.nix
		./components/printing.nix
		./components/sound.nix
		./components/time.nix

		# Programs
		./components/programs/adb.nix           # Android development bridge
		./components/programs/borg-backup.nix   # Backup daemon
		./components/programs/dconf.nix         # Gnome configuration
		./components/programs/gnome-keyring.nix # Keychain daemon
		./components/programs/gpg.nix           # Encryption tool
		./components/programs/mysql.nix         # Database server
		./components/programs/postgres.nix      # Database server
		./components/programs/tailscale.nix     # Private network
		# ./components/programs/virtualbox.nix  # Hardware virtualizer
		./components/programs/xrdp.nix          # Remote access

		# Generated
		./hardware-configuration.nix            # Generated hardware configuration
	];

	nix = {
		trustedUsers = [ "khushraj" ];
		autoOptimiseStore = true;
		package = pkgs.nixUnstable;
		# Use system nixpkgs for vvvvvvv
		#             "nix shell nixpkgs#<pkgname>"
		registry.nixpkgs.flake = nixpkgs-ref;
		extraOptions = ''
			experimental-features = nix-command flakes
			keep-outputs = true
			keep-derivations = true
		'';
	};

	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = [
			"electron-9.4.4"
		];
	};

	system.stateVersion = "21.05"; 	# State version, do not change with OS upgrade
}
