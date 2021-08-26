{ pkgs, stable, nixpkgs-ref, config, lib, ... }:

{	
	imports = [
		# Components
		./components/accounts.nix
		./components/bluetooth.nix
		./components/boot.nix
		./components/display.nix
		./components/file-system.nix
		./components/gnome.nix
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
		# Use system nixpkgs for vvvvvvv
		#             "nix shell nixpkgs#<pkgname>"
		registry.nixpkgs.flake = nixpkgs-ref;
		extraOptions = ''
			experimental-features = nix-command flakes
			keep-outputs = true
			keep-derivations = true
		'';
	};

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "21.05"; 	# State version, do not change with OS upgrade
}
