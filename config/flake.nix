{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-21.05";
		nixpkgs-dev.url = "path:/home/khushraj/Builds/nixpkgs";
		home-manager.url = "github:nix-community/home-manager";
		cachix.url = "github:jonascarpay/declarative-cachix";
	};

	outputs = { nixpkgs, nixpkgs-stable, nixpkgs-dev, home-manager, cachix, ... }: {
		nixosConfigurations.khushrajs-desktop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = 
			[
				cachix.nixosModules.declarative-cachix
				({ pkgs, ... }: {
					_module.args.nixpkgs-ref = nixpkgs;
					_module.args.stable = import nixpkgs-stable { inherit (pkgs.stdenv.targetPlatform) system; };
					_module.args.dev = import nixpkgs-dev { inherit (pkgs.stdenv.targetPlatform) system; };
					imports = [ ./os/os.nix ];
				})
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.khushraj = { pkgs, ... }: {
						_module.args.stable = import nixpkgs-stable { inherit (pkgs.stdenv.targetPlatform) system; };
						_module.args.dev = import nixpkgs-dev { inherit (pkgs.stdenv.targetPlatform) system; };
						imports = [ ./home/home.nix ];
					};
				}
			];
		};
	};
}
