{ ... }:

{
	system.autoUpgrade = {
		enable = true;
		flags = [
			"--update-input" "nixpkgs"
			"--update-input" "nixpkgs-stable"
			"--update-input" "home-manager"
			"--update-input" "cachix"
		];
	};
}