{ pkgs, stable, inputs, config, lib, userDetails, ... }:

{	
	imports = [
		# Components
		../components/accounts.nix
		../components/auto-upgrade.nix
		../components/bluetooth.nix
		../components/boot.nix
		../components/discovery.nix
		../components/display.nix
		../components/environment.nix
		../components/file-system.nix
		../components/fonts.nix
		../components/gnome.nix
		../components/hardware.nix
		../components/network.nix
		../components/sound.nix
		../components/time.nix

		# Programs
		../components/programs/adb.nix               # Android development bridge
		../components/programs/chrome.nix            # Browser config
		../components/programs/disable.nix           # Disabled defaults
		../components/programs/docker.nix            # Containerizer
		../components/programs/dconf.nix             # Gnome configuration
		../components/programs/git.nix               # VCS	
		../components/programs/gnome-keyring.nix     # Keychain daemon
		../components/programs/gpg.nix               # Encryption tool
		../components/programs/home-manager.nix      # Home manager
		../components/programs/tailscale.nix         # Virtual Private Network
		../components/programs/restic.nix            # Backup daemon
		../components/programs/virtualbox.nix        # Hardware virtualizer

		# Generated
		./hardware-configuration.nix                # Generated hardware configuration
	];

	nix = {
		package = pkgs.nixVersions.latest;
		# Use system nixpkgs for vvvvvvv
		#             "nix shell nixpkgs#<pkgname>"
		registry.nixpkgs.flake = inputs.nixos-unstable;
		extraOptions = ''
			experimental-features = nix-command flakes
		'';
		settings = {
			trusted-users = [ userDetails.username ];
			auto-optimise-store = true;
			cores = 4;
		};
	};

	system.stateVersion = "24.05"; 	# State version, do not change with OS upgrade
}
