{ ... }:

{
	system.autoUpgrade = {
		enable = true;
		dates = "15:00";
		flake = "/home/khushraj/nixos-config/config";
		flags = [
			"--update-input" "nixpkgs-unstable"
			"--update-input" "nixpkgs-stable"
			"--update-input" "nixpkgs-master"
			"--update-input" "home-manager"
			"--update-input" "cachix"
		];
	};
}