{ pkgs, ... }:

{
	programs.vscode = {
		enable = true;
		package = pkgs.vscode-fhs;
		extensions = with pkgs.vscode-extensions; [
			bbenoist.Nix
			matklad.rust-analyzer
		];
	};
}
