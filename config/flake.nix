{
	description = "NixOS configuration";

	inputs = {
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-21.05";
		nixpkgs-master.url = "github:nixos/nixpkgs";
		home-manager.url = "github:nix-community/home-manager";
		cachix.url = "github:jonascarpay/declarative-cachix";
	};

	outputs = { nixpkgs-unstable, nixpkgs-stable, nixpkgs-master, home-manager, cachix, ... }: {
		nixosConfigurations.khushrajs-desktop = nixpkgs-unstable.lib.nixosSystem {
			system = "x86_64-linux";
			modules = 
			[
				cachix.nixosModules.declarative-cachix
				({ pkgs, ... }: {
					_module.args.nixpkgs-ref = nixpkgs-unstable;
					_module.args.stable = import nixpkgs-stable { inherit (pkgs.stdenv.targetPlatform) system; };
					_module.args.master = import nixpkgs-master { inherit (pkgs.stdenv.targetPlatform) system; };
					imports = [ ./os/os.nix ];
				})
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.khushraj = { pkgs, ... }: {
						_module.args.stable = import nixpkgs-stable { inherit (pkgs.stdenv.targetPlatform) system; };
						_module.args.master = import nixpkgs-master { inherit (pkgs.stdenv.targetPlatform) system; };
						imports = [ ./home/home.nix ];
					};
				}
			];
		};
	};
}
