{
	description = "NixOS configuration";

	inputs = {
		nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		nixos-unstable-small.url = "github:nixos/nixpkgs/nixos-unstable-small";
		nixos-stable.url = "github:nixos/nixpkgs/nixos-21.05";
		home-manager.url = "github:nix-community/home-manager";
	};

	outputs = { nixos-unstable, nixos-unstable-small, nixos-stable, home-manager, ... }: {
		nixosConfigurations.khushrajs-desktop = nixos-unstable.lib.nixosSystem {
			system = "x86_64-linux";
			modules = 
			[
				({ pkgs, ... }: {
					_module.args.unstable-ref = nixos-unstable;
					_module.args.stable = import nixos-stable { inherit (pkgs.stdenv.targetPlatform) system; };
					_module.args.unstable-small = import nixos-unstable-small { inherit (pkgs.stdenv.targetPlatform) system; };
					imports = [ ./os/os.nix ];
				})
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.khushraj = { pkgs, ... }: {
						_module.args.stable = import nixos-stable { inherit (pkgs.stdenv.targetPlatform) system; };
						_module.args.unstable-small = import nixos-unstable-small { inherit (pkgs.stdenv.targetPlatform) system; };
						imports = [ ./home/home.nix ];
					};
				}
			];
		};
	};
}
