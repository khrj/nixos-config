{ config, pkgs, lib, ... }:

{
	imports = [
		# NixOS
		./os/os.nix

		# Home Manager
		(import "${builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz}/nixos")
	];

	home-manager.users.khushraj = import ./home/home.nix;
}
