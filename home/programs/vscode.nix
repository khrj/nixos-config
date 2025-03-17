{ pkgs, ... }:

{
	programs.vscode = {
		enable = true;
		profiles.default.extensions = with pkgs.vscode-extensions; [
			bbenoist.nix
			rust-lang.rust-analyzer
			ms-vsliveshare.vsliveshare
			vadimcn.vscode-lldb
		];
	};
}
