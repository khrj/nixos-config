{ pkgs, stable, unstable-ref, config, lib, ... }:

{	
	imports = [
		# Components
		./components/accounts.nix
		./components/auto-upgrade.nix
		./components/bluetooth.nix
		./components/boot.nix
		./components/display.nix
		./components/file-system.nix
		./components/fonts.nix
		./components/gnome.nix
		./components/hardware.nix
		./components/network.nix
		./components/sound.nix
		./components/time.nix

		# Programs
		./components/programs/adb.nix           # Android development bridge
		./components/programs/borg-backup.nix   # Backup daemon
		./components/programs/disable.nix       # Disabled defaults
		./components/programs/dconf.nix         # Gnome configuration
		./components/programs/gnome-keyring.nix # Keychain daemon
		./components/programs/gpg.nix           # Encryption tool
		./components/programs/mysql.nix         # Database server
		./components/programs/postgresql.nix    # Database server
		./components/programs/tailscale.nix     # Private network
		./components/programs/virtualbox.nix    # Hardware virtualizer
		./components/programs/xrdp.nix          # Remote access

		# Generated
		./hardware-configuration.nix            # Generated hardware configuration
	];

	nix = {
		package = pkgs.nixUnstable;
		# Use system nixpkgs for vvvvvvv
		#             "nix shell nixpkgs#<pkgname>"
		registry.nixpkgs.flake = unstable-ref;
		extraOptions = ''
			experimental-features = nix-command flakes
		'';
		settings = {
			trusted-users = [ "khushraj" ];
			auto-optimise-store = true;
		};
	};

	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = [
			"electron-12.2.3"
		];
	};

	system.stateVersion = "21.05"; 	# State version, do not change with OS upgrade
}
