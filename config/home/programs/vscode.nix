{ pkgs, ... }:

{
	programs.vscode = {
		enable = true;
		extensions = with pkgs.vscode-extensions; [
			bbenoist.nix
			matklad.rust-analyzer
			ms-vsliveshare.vsliveshare
		];
	};
}
