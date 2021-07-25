{
	description = "NixOS configuration";

	inputs = {
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
		home-manager.url = "github:nix-community/home-manager/release-21.05";
		cachix.url = "github:jonascarpay/declarative-cachix";
	};

	outputs = { nixpkgs, nixpkgs-unstable, home-manager, cachix, ... }: {
		nixosConfigurations.khushrajs-desktop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = 
			[
				cachix.nixosModules.declarative-cachix
				({ pkgs, ... }: {
					_module.args.unstable = import nixpkgs-unstable { inherit (pkgs.stdenv.targetPlatform) system; };
					imports = [ ./os/os.nix ];
				})
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.khushraj = { pkgs, ... }: {
						_module.args.unstable = import nixpkgs-unstable { inherit (pkgs.stdenv.targetPlatform) system; };
						imports = [ ./home/home.nix ];
					};
				}
			];
		};
	};
}
