{ ... }:

{
	system.autoUpgrade = {
		enable = true;
		dates = "15:00";
		flags = [
			"--update-input" "nixpkgs"
			"--update-input" "nixpkgs-stable"
			"--update-input" "home-manager"
			"--update-input" "cachix"
		];
	};
}