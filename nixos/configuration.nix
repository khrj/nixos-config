{ config, pkgs, lib, ... }:

{
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"Oracle_VM_VirtualBox_Extension_Pack"
	];

	programs.dconf.enable = true;
	nix.trustedUsers = [ "khushraj" ];
	nix.autoOptimiseStore = true;
	system.stateVersion = "21.05"; 	# State version, do not change with OS upgrade

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
		./components/programs/postgres.nix      # Database server
		./components/programs/virtualbox.nix    # Hardware virtualizer

		# Generated
		./auth.nix
		./hardware-configuration.nix
	];
}
