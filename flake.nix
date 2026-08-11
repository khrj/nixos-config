{	
	inputs = {
		nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixos-stable.url = "github:nixos/nixpkgs/nixos-26.05";
		nixos-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
		nixos-unstable-lagging.url = "github:nixos/nixpkgs/nixos-unstable"; # "github:nixos/nixpkgs/3a5f01cf1a0d7374395bfb2f67d021362cc71373";
		nixos-unstable-leading.url = "github:nixos/nixpkgs/nixos-unstable"; # "github:nixos/nixpkgs/7fed5716a2ba3a3794a0c0e6ad1202619dd6e458";
		nixos-system.url = "github:nixos/nixpkgs/nixos-unstable";
		impermanence.url = "github:nix-community/impermanence";

		nix-index-database = {
			url = "github:nix-community/nix-index-database";
			inputs.nixpkgs.follows = "nixos-unstable";
		};
		
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixos-unstable";
		};
		
		android-nixpkgs = {
			url = "github:tadfisher/android-nixpkgs";
			inputs.nixpkgs.follows = "nixos-unstable";
		};
	};

	outputs = inputs:
		let
			config = {
				allowUnfree = true;
				permittedInsecurePackages = [ "electron-19.1.9" "electron-25.9.0" "libxml2-2.13.8" "python3.13-ecdsa-0.19.1" ];
			};

			userDetails = rec {
				username = "khushraj";
				name = "Khushraj Rathod";
				email = "khushraj.rathod@gmail.com";
				homeDirectory = "/home/${username}";
				desktopHostname = "${username}s-desktop";
			};

			mkConfig = type: machineModule: system:
				let
					sources = {
						pkgs = import inputs.nixos-unstable { inherit system config; };
						system = import inputs.nixos-system { inherit system config; };
						unstable-small = import inputs.nixos-unstable-small { inherit system config; };
						stable = import inputs.nixos-stable { inherit system config; };
						lagging = import inputs.nixos-unstable-lagging { inherit system config; };
						leading = import inputs.nixos-unstable-leading { inherit system config; };
					};
				in
					if type == "system" then mkSystemConfig machineModule system sources
					else mkHomeConfig machineModule sources;

			mkSystemConfig = machineModule: system: sources:
				inputs.nixos-system.lib.nixosSystem {
					specialArgs = { inherit inputs userDetails; } // builtins.removeAttrs sources ["pkgs"];
					modules = [
						inputs.impermanence.nixosModules.impermanence
						machineModule
						{
							# Used to make nix-index work with flakes, sets nixPath to flake output rather than a nix-channel
							nix.nixPath = [ "nixpkgs=${inputs.nixos-unstable}" ];
							nixpkgs.hostPlatform = system;
						}
					];
				};

			mkHomeConfig = machineModule: sources: 
				inputs.home-manager.lib.homeManagerConfiguration {
					inherit (sources) pkgs;
					modules = [
						inputs.nix-index-database.homeModules.nix-index
						machineModule
						{
							home = {
								inherit (userDetails) username homeDirectory;
							};
						}	
					];

					extraSpecialArgs = { inherit inputs userDetails; } // builtins.removeAttrs sources ["pkgs"];
				};
		in {
			nixosConfigurations."${userDetails.desktopHostname}" = mkConfig "system" ./os/${userDetails.desktopHostname}/os.nix "x86_64-linux";
			nixosConfigurations."notebook" = mkConfig "system" ./os/notebook/os.nix "x86_64-linux";
			homeConfigurations."${userDetails.username}@${userDetails.desktopHostname}" = mkConfig "home" ./home/desktop.nix "x86_64-linux";
			homeConfigurations."${userDetails.username}@notebook" = mkConfig "home" ./home/desktop.nix "x86_64-linux";
			homeConfigurations."${userDetails.username}@eternity" = mkConfig "home" ./home/eternity.nix "aarch64-linux";
		};
}
