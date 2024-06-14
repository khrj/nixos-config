{ pkgs, ... }:

{
	programs.vscode = {
		enable = true;
		extensions = with pkgs.vscode-extensions; [
			bbenoist.nix
			rust-lang.rust-analyzer
			ms-vsliveshare.vsliveshare
			vadimcn.vscode-lldb
		];
	};
}
