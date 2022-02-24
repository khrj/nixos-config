{ ... }:

{
	system.autoUpgrade = {
		enable = false;
		dates = "15:00";
		flake = "/home/khushraj/nixos-config/config";
		flags = [
			"--update-input" "nixos-unstable"
			"--update-input" "nixos-unstable-small"
			"--update-input" "nixos-stable"
			"--update-input" "home-manager"
		];
	};
}