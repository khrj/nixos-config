{	
	inputs = {
		nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixos-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
		nixos-unstable-lagging.url = "github:nixos/nixpkgs/750c9abe9f4ee48dee72508db8bb19d53e358132";
		nixos-unstable-leading.url = "github:nixos/nixpkgs/35e24243c386a31c6693b51b55a9767f08e9c205";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixos-unstable";
		};
		android-nixpkgs = {
			url = "github:tadfisher/android-nixpkgs";
			inputs.nixpkgs.follows = "nixos-unstable";
		};
	};

	outputs = { nixos-unstable, nixos-unstable-lagging, nixos-unstable-leading, nixos-unstable-small, home-manager, android-nixpkgs, ... }@inputs:
		let
			config = {
				allowUnfree = true;
				permittedInsecurePackages = [ "electron-12.2.3" "xrdp-0.9.9" ];
			};

			system = "x86_64-linux";

			userDetails = {
				username = "khushraj";
				name = "Khushraj Rathod";
				email = "khushraj.rathod@gmail.com";
			};

			username = userDetails.username;
			
			pkgs = import nixos-unstable { inherit system config; };
			unstable-small = import nixos-unstable-small { inherit system config; };
			lagging = import nixos-unstable-lagging { inherit system config; };
			leading = import nixos-unstable-leading { inherit system config; };
		in {
			nixosConfigurations."${username}s-desktop" = nixos-unstable.lib.nixosSystem {
				inherit system pkgs;
				specialArgs = { inherit inputs unstable-small lagging leading userDetails; };
				modules = [
					./os/os.nix
					{
						# Used to make nix-index work with flakes, sets nixPath to flake output rather than a nix-channel
						nix.nixPath = [ "nixpkgs=${nixos-unstable}" ];
					}
				];
			};
			homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home/home.nix
					{
						home = {
							inherit username;
							homeDirectory = "/home/${username}";
							stateVersion = "22.05";
						};
					}
				];

				extraSpecialArgs = { inherit inputs unstable-small lagging leading userDetails android-nixpkgs; };
			};
		};
}
