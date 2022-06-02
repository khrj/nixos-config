{
	inputs = {
		nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixos-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
		nixos-stable.url = "github:nixos/nixpkgs/nixos-21.05";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixos-unstable";
		};
	};

	outputs = { nixos-unstable, nixos-unstable-small, nixos-stable, home-manager, ... }@inputs:
		let
			config = {
				allowUnfree = true;
				permittedInsecurePackages = [ "electron-12.2.3" ];
			};

			system = "x86_64-linux";

			userDetails = {
				username = "khushraj";
				name = "Khushraj Rathod";
				email = "khushraj.rathod@gmail.com";
			};

			username = userDetails.username;
			
			pkgs = import nixos-unstable { inherit system config; };
			stable = import nixos-stable { inherit system config; };
			unstable-small = import nixos-unstable-small { inherit system config; };
		in {
			nixosConfigurations."${username}s-desktop" = nixos-unstable.lib.nixosSystem {
				inherit system pkgs;
				specialArgs = { inherit inputs stable unstable-small userDetails; };
				modules = [
					./os/os.nix
					{
						# Used to make nix-index work with flakes, sets nixPath to flake output rather than a nix-channel
						nix.nixPath = [ "nixpkgs=${nixos-unstable}" ];
					}
				];
			};
			homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
				inherit system pkgs username;

				configuration = import ./home/home.nix;
				homeDirectory = "/home/${username}";
				stateVersion = "22.05";

				extraSpecialArgs = { inherit inputs stable unstable-small userDetails; };
			};
		};
}
