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

	outputs = { nixos-unstable, nixos-unstable-small, nixos-stable, home-manager, ... }: {
		nixosConfigurations.khushrajs-desktop = nixos-unstable.lib.nixosSystem {
			system = "x86_64-linux";
			modules = 
			[
				({ pkgs, ... }: {
					_module.args.unstable-ref = nixos-unstable;
					_module.args.stable = import nixos-stable { inherit (pkgs.stdenv.targetPlatform) system; };
					_module.args.unstable-small = import nixos-unstable-small { inherit (pkgs.stdenv.targetPlatform) system; config.allowUnfree = true; };
					imports = [ ./os/os.nix ];
				})
				{
					# Used to make nix-index work with flakes, sets nixPath to flake output rather than a nix-channel
					nix.nixPath = [ "nixpkgs=${nixos-unstable}" ];
				}
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.khushraj = { pkgs, ... }: {
						_module.args.stable = import nixos-stable { inherit (pkgs.stdenv.targetPlatform) system; };
						_module.args.unstable-small = import nixos-unstable-small { inherit (pkgs.stdenv.targetPlatform) system; config.allowUnfree = true; };
						imports = [ ./home/home.nix ];
					};
				}
			];
		};
	};
}
