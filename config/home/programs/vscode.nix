{ pkgs, ... }:

{
	programs.vscode = {
		enable = true;
		extensions = with pkgs.vscode-extensions; [
			bbenoist.Nix
			matklad.rust-analyzer
			ms-vsliveshare.vsliveshare
		];
	};
}
